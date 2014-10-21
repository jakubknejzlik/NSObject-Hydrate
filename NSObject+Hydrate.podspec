Pod::Spec.new do |s|
  s.name         = "NSObject+Hydrate"
  s.version      = "0.0.6"
  s.summary      = "Hydratation function for NSObject and NSManagedObject."

  s.description  = <<-DESC
                    Hydratation function for NSObject and NSManagedObject from data object (KVC);
                   DESC
  s.homepage     = "https://github.com/jakubknejzlik/NSObject-Hydrate"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jakub Knejzlik" => "jakub.knejzlik@gmail.com" }
  s.source       = { :git => "https://github.com/jakubknejzlik/NSObject-Hydrate.git", :tag => "0.0.6" }
  s.source_files  = "NSObject+Hydrate/*.{h,m}"
  s.framework  = "CoreData"
  s.requires_arc = true
end
