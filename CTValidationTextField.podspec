#
# Be sure to run `pod lib lint CTValidationTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CTValidationTextField'
  s.version          = '0.1.0'
  s.summary          = 'CTValidationTextField its build-in validator with different validation rules'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
CTValidationTextField its validation library with extendalbe validating rules. Main idea it's give ability to validate UITextField's with few rules what can overlap each-other or can be required.'
                       DESC

  s.homepage         = 'https://github.com/ChernyshenkoTaras/CTValidationTextField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Taras Chernyshenko' => 'taras.chernyshenko@gmail.com' }
  s.source           = { :git => 'https://github.com/ChernyshenkoTaras/CTValidationTextField.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@t_chernyshenko'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CTValidationTextField/CTValidationTextField/Classes/**/*'
end
