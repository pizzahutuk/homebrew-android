require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis25SysimgArmv7 < AndroidSysimgFormula
  desc "Google APIs ARM EABI v7a System Image"
  url "https://dl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-25_r13.zip"
  version "13"
  sha1 "6b5db2fe690e61f9059af1a2f13c630594cc8b02"
  api_version "25"
  abi "armeabi-v7a"
  sysimg_tag "/google_apis"

  src_properties <<~EOS
    AndroidVersion.ApiLevel=25
    Pkg.Revision=#{version}
    SystemImage.Abi=armeabi-v7a
    SystemImage.TagId=google_apis
    SystemImage.TagDisplay=Google APIs
  EOS

  depends_on "pizzahutuk/android/android-25"

  test do
    system "true"
  end
end
