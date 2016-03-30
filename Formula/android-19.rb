require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android19 < AndroidPlatformFormula
  url 'https://dl.google.com/android/repository/android-19_r04.zip'
  version '4'
  sha1 '2ff20d89e68f2f5390981342e009db5a2d456aaa'
  api_version '19'
  target_directory 'platforms'
  target_name      'android'

  # Dependencies for docs, sources, and samples
  sources [ 'toonetown/android/android-19-sources' ]

end
