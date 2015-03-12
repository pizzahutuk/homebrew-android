require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android22Sources < AndroidSourcesFormula
  url 'http://dl-ssl.google.com/android/repository/sources-22_r01.zip'
  version '1'
  sha1 '98320e13976d11597a4a730a8d203ac9a03ed5a6'
  api_version '22'
end
