//
//  NSObject+Hydrate.h
//  ey
//
//  Created by Jakub Knejzlik on 16/09/14.
//  Copyright (c) 2014 Funtasty Digital s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Hydrate)

-(void)hydrateObjectWithData:(id)data;
-(void)hydrateObjectWithData:(id)data withMapping:(NSDictionary *)mapping;

@end
