Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '17.0'
s.name = "DHLModalHelper"
s.summary = "Modales personalizados para swiftUI"
s.requires_arc = true

s.version = "1.0.1"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Daniel Hernandez Lopez" => "hzlzdaniel@gmail.com" }

s.homepage = "https://github.com/daniel-herlop/DHLModalHelper"

s.source = { :git => "https://github.com/daniel-herlop/DHLModalHelper.git", 
             :tag => "#{s.version}" }

s.source_files = "DHLModalHelper/**/*.{swift}"

#s.resources = "DHLModalHelper/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,strings}"

s.swift_version = "5.0"

end