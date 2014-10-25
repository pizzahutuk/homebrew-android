require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android15 < AndroidPlatformFormula
  url 'http://dl-ssl.google.com/android/repository/android-15_r05.zip'
  version '5'
  sha1 '69ab4c443b37184b2883af1fd38cc20cbeffd0f3'
  api_version '15'

  # Dependencies for docs, sources, samples, and system images
  sources [ 'toonetown/android/android-15-sources' ]
  samples [ 'toonetown/android/android-15-samples' ]
  sysimg  [
    'toonetown/android/android-15-sysimg-armv7',
    'toonetown/android/android-15-sysimg-i386',
  ]

end
