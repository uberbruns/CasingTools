Pod::Spec.new do |s|
  s.name = "CasingTools"
  s.version = "0.0.3"
  s.summary = "CasingTools alows you to case strings."
  s.description = "CasingTools is a Swift Library you can use to change the casing of strings. Supported casing formats include a wide variety of options from camelCase to UPPER_SNAIL_CASE."
  s.homepage = "https://github.com/uberbruns/CasingTools"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Karsten Bruns" => "karsten@bruns.me" }
  s.social_media_url = ""
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source = { :git => "https://github.com/uberbruns/CasingTools.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.ios.exclude_files = 'Sources/CasingTools/main.swift'
  s.frameworks  = "Foundation"
end
