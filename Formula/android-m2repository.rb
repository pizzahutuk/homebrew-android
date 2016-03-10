# This file is autogenerated by the generate-sdks.sh script

require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-tool-formula')

class AndroidM2repository < AndroidToolFormula
  url 'http://dl-ssl.google.com/android/repository/android_m2repository_r28.zip'
  version '28'
  sha1 'e4d0ad49df085a8d0322cfc4cfaa5e74a7b0569b'
  depends_on "toonetown/android/android-sdk"

  def install
    (prefix/"extras/android/m2repository").install Dir["*"]
    install_tools prefix/"extras/android/m2repository"

    srcProp = prefix/"extras/android/m2repository/source.properties"
    srcProp.delete if srcProp.exist?
    srcProp.write <<-EOS.undent
      Extra.VendorId=android
      Extra.Path=m2repository
      Pkg.Revision=#{version}
    EOS

    link_sdk_dir "extras/android"
  end
  
end
