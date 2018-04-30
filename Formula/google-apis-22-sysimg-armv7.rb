require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis22SysimgArmv7 < AndroidSysimgFormula
  desc "Google APIs ARM EABI v7a System Image"
  url "https://dl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-22_r21.zip"
  version "21"
  sha1 "d75d02bd4999d8972b9b0233570eed4a8556ded5"
  api_version "22"
  abi "armeabi-v7a"
  sysimg_tag "/google_apis"

  src_properties <<~EOS
    AndroidVersion.ApiLevel=22
    Pkg.Revision=#{version}
    SystemImage.Abi=armeabi-v7a
    SystemImage.TagId=google_apis
    SystemImage.TagDisplay=Google APIs
  EOS

  depends_on "pizzahutuk/android/android-22"

  test do
    system "true"
  end
end
