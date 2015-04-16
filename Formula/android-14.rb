require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android14 < AndroidPlatformFormula
  url 'http://dl-ssl.google.com/android/repository/android-14_r04.zip'
  version '4'
  sha1 'd4f1d8fbca25225b5f0e7a0adf0d39c3d6e60b3c'
  api_version '14'

  # Dependencies for docs, sources, samples, and system images
  sources [ 'toonetown/android/android-14-sources' ]
  samples [ 'toonetown/android/android-14-samples' ]

end
