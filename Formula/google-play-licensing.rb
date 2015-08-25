# This file is autogenerated by the generate-sdks.sh script

require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-tool-formula')

class GooglePlayLicensing < AndroidToolFormula
  url 'http://dl-ssl.google.com/android/repository/market_licensing-r02.zip'
  version '2'
  sha1 '355e8dc304a92a5616db235af8ee7bd554356254'
  depends_on "toonetown/android/android-sdk"

  def install
    (prefix/"extras/google/play_licensing").install Dir["*"]
    install_tools prefix/"extras/google/play_licensing"

    srcProp = prefix/"extras/google/play_licensing/source.properties"
    srcProp.delete if srcProp.exist?
    srcProp.write <<-EOS.undent
      Extra.VendorId=google
      Extra.Path=play_licensing
      Pkg.Revision=#{version}
    EOS

    link_sdk_dir "extras/google"
  end
  
end