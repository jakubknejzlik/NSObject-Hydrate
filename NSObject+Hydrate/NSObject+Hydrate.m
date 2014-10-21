//
//  NSObject+Hydrate.m
//  ey
//
//  Created by Jakub Knejzlik on 16/09/14.
//  Copyright (c) 2014 Funtasty Digital s.r.o. All rights reserved.
//

#import "NSObject+Hydrate.h"

#import <objc/runtime.h>

@implementation NSObject (Hydrate)

-(void)hydrateObjectWithData:(id)data{
    [self hydrateObjectWithData:data withMapping:nil];
}
-(void)hydrateObjectWithData:(id)data withMapping:(NSDictionary *)mapping{
    for (NSString *propName in [self hyd_getPropertiesOfClass:[self class]]) {
        NSString *mappedPropName = propName;
        if(mapping[propName])mappedPropName = mapping[propName];
        id value = data[mappedPropName];
        if(value){
            if([value isKindOfClass:[NSNull class]])[self setNilValueForKey:propName];
            else [self setValue:value forKey:propName];
        }
    }
}

-(NSArray*)hyd_getPropertiesOfClass:(Class)objectClass
{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(objectClass, &outCount);
    NSMutableArray *gather = [NSMutableArray arrayWithCapacity:outCount];
    NSMutableDictionary *propertyClasses = [NSMutableDictionary dictionary];
    for(i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        NSString* propName = [NSString stringWithUTF8String:property_getName(property)];
        const char *type = property_getAttributes(property);
        
        NSString *typeString = [NSString stringWithUTF8String:type];
        NSArray *attributes = [typeString componentsSeparatedByString:@","];
        NSString *typeAttribute = [attributes objectAtIndex:0];
        
        if ([typeAttribute hasPrefix:@"T@"] && [typeAttribute length] > 3)
        {
            NSString * typeClassName = [typeAttribute substringWithRange:NSMakeRange(3, [typeAttribute length]-4)];  //turns @"NSDate" into NSDate
            Class typeClass = NSClassFromString(typeClassName);
            if(typeClass)[propertyClasses setObject:typeClass forKey:propName];
        }
        [gather addObject:propName];
    }
    free(properties);
    if([objectClass superclass] && [objectClass superclass] != [NSObject class]){
//        NSLog(@"%@,%@",gather,[objectClass superclass]);
        [gather addObjectsFromArray:[self hyd_getPropertiesOfClass:[objectClass superclass]]];
    }
    return gather;
}

@end
