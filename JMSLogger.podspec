#
# Be sure to run `pod lib lint JMSLogger.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JMSLogger"
  s.version          = "0.1.0"
  s.summary          = "Logger for CocoaLumberjack that allows logs to be read again for displaying them"
  s.description      = <<-DESC
                       This project implements a logger stores logs and allows to read them back. It uses the Realm database for storing the data, though this is an implementation detail and could change at any time.
                       DESC
  s.homepage         = "https://github.com/buscarini/JMSLogger"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "José Manuel Sánchez" => "buscarini@gmail.com" }
  s.source           = { :git => "https://github.com/buscarini/JMSLogger.git", :tag => "0.0.1" }
  # s.social_media_url = 'https://twitter.com/buscarini'

	s.ios.deployment_target = '7.0'
	s.osx.deployment_target = '10.8'
  
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'JMSLogger' => ['Pod/Assets/*.png']
  }
  
  s.dependency 'Realm', '~> 0.84'
	s.dependency 'AFNetworking', '~> 2.3'
	s.dependency 'CocoaLumberjack'

end
