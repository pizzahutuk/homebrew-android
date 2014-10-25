require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android18 < AndroidPlatformFormula
  url 'http://dl-ssl.google.com/android/repository/android-18_r03.zip'
  version '3'
  sha1 'e6b09b3505754cbbeb4a5622008b907262ee91cb'
  api_version '18'

  # Dependencies for docs, sources, samples, and system images
  sources [ 'toonetown/android/android-18-sources' ]
  samples [ 'toonetown/android/android-18-samples' ]
  sysimg  [
    'toonetown/android/android-18-sysimg-armv7',
    'toonetown/android/android-18-sysimg-i386',
  ]

end
