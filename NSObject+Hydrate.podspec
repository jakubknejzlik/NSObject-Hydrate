Pod::Spec.new do |s|
  s.name         = "NSObject+Hydrate"
  s.version      = "0.0.1"
  s.summary      = "A short description of NSObject+Hydrate."

  s.description  = <<-DESC
                   A longer description of NSObject+Hydrate in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC
  s.homepage     = "https://github.com/jakubknejzlik/NSObject-Hydrate"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jakub Knejzlik" => "jakub.knejzlik@gmail.com" }
  s.source       = { :git => "https://github.com/jakubknejzlik/NSObject-Hydrate.git", :tag => "0.0.1" }
  s.source_files  = "NSObject+Hydrate/*.{h,m}"
  s.framework  = "CoreData"
end
