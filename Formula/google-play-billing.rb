# This file is autogenerated by the generate-sdks.sh script

require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-tool-formula')

class GooglePlayBilling < AndroidToolFormula
  url 'http://dl-ssl.google.com/android/repository/play_billing_r05.zip'
  version '5'
  sha1 'bd2ac5ce7127070ac3229003eb69cfb806628ac9'
  depends_on "toonetown/android/android-sdk"

  def install
    (prefix/"extras/google/play_billing").install Dir["*"]
    install_tools prefix/"extras/google/play_billing"

    srcProp = prefix/"extras/google/play_billing/source.properties"
    srcProp.delete if srcProp.exist?
    srcProp.write <<-EOS.undent
      Extra.VendorId=google
      Extra.Path=play_billing
      Pkg.Revision=#{version}
    EOS

    link_sdk_dir "extras/google"
  end
  
end
