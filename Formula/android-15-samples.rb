require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android15Samples < AndroidSamplesFormula
  url 'https://dl-ssl.google.com/android/repository/samples-15_r02.zip'
  version '2'
  sha1 '042f368c5b09eca4d278264e6dbf9c12c5f73d1f'
  api_version '15'
end
