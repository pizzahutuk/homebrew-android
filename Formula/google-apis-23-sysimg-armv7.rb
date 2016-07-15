require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula")

class GoogleApis23SysimgArmv7 < AndroidSysimgFormula
  desc "Google APIs ARM EABI v7a System Image"
  url "http://dl.google.com/android/repository/sys-img/google_apis/sysimg_armeabi-v7a-23_r15.zip"
  version "15"
  sha1 "4c92f885a19243e9d6fa61495595ae5c8e3bbf64"
  api_version "23"
  abi "armeabi-v7a"
  sysimg_tag "/google_apis"

  src_properties <<-EOS.undent
    Addon.VendorId=google
    AndroidVersion.ApiLevel=23
    Pkg.Revision=#{version}
    SystemImage.Abi=armeabi-v7a
    SystemImage.TagId=google_apis
  EOS

  depends_on "toonetown/android/google-apis-23"

  test do
    system "true"
  end
end
