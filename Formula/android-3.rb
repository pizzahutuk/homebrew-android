require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android3 < AndroidPlatformFormula
  url 'https://dl-ssl.google.com/android/repository/android-1.5_r04-macosx.zip'
  version '04'
  sha1 'd3a67c2369afa48b6c3c7624de5031c262018d1e'
  api_version '3'

  # Dependencies for docs, sources, and samples

end
