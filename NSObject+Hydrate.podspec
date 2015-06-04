Pod::Spec.new do |s|
  s.name         = "NSObject+Hydrate"
  s.version      = "0.0.9"
  s.summary      = "Hydratation function for NSObject and NSManagedObject."

  s.description  = <<-DESC
                    Hydratation function for NSObject and NSManagedObject from data object (KVC);
                   DESC
  s.homepage     = "https://github.com/jakubknejzlik/NSObject-Hydrate"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jakub Knejzlik" => "jakub.knejzlik@gmail.com" }
  s.source       = { :git => "https://github.com/jakubknejzlik/NSObject-Hydrate.git", s.version.to_string }
  s.source_files  = "NSObject+Hydrate/*.{h,m}"
  s.framework  = "CoreData"
  s.requires_arc = true
end
