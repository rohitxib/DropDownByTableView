Pod::Spec.new do |spec|

  spec.name         = "DropDownByTableView"
  spec.version      = "1.0.0"
  spec.summary      = "this is framework to add dropdown"
  spec.description = " i have no idea what to  and write in description"
spec.ios.deployment_target = '16.1'
  spec.homepage     = "https://github.com/rohitxib/DropDownByTableView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Rohit Dwivedi" => "rohit.dwivedi1000@gmail.com" }
  # spec.platform     = :ios


  spec.source       = { :git => "https://github.com/rohitxib/DropDownByTableView.git", :tag => "#{spec.version}" }
  spec.source_files  = "DropDownByTableView/**/*.{swift}"

spec.framework = "UIKit"

spec.resources = "DropDownByTableView/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
spec.swift_version = "5.0"

 
end
