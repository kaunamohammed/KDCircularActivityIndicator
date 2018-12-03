Pod::Spec.new do |s|

  s.name         = "KDCircularActivityIndicator"
  s.version      = "1.0.0"
  s.summary      = "This is a circle activity indicator "
  s.description  = "A circle activity indicator written in swift"
  s.homepage     = "https://github.com/kaunamohammed/KDCircularActivityIndicator"
  s.license      = "MIT"
  s.author       = { "Kauna Mohammed" => "kaunamohammed@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/kaunamohammed/KDCircularActivityIndicator.git", :tag => "#{s.version}" }
  s.source_files  = "KDCircularActivityIndicator/**/*"
  s.exclude_files = "KDCircularActivityIndicator/KDCircularActivityIndicator/*.plist"
end
