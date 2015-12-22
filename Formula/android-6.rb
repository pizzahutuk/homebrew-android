require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android6 < AndroidPlatformFormula
  url 'https://dl.google.com/android/repository/android-2.0.1_r01-macosx.zip'
  version '01'
  sha1 'c3096f80d75a6fc8cb38ef8a18aec920e53d42c0'
  api_version '6'
  target_directory 'platforms'
  target_name      'android'

  # Dependencies for docs, sources, and samples

end
