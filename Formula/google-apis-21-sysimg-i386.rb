require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis21SysimgI386 < AndroidSysimgFormula
  desc "Google APIs Intel x86 Atom System Image"
  url "https://dl.google.com/android/repository/sys-img/google_apis/x86-21_r27.zip"
  version "27"
  sha1 "429eb2560848d7a86695313bca77b7a9af57600c"
  api_version "21"
  abi "x86"
  sysimg_tag "/google_apis"

  src_properties <<~EOS
    AndroidVersion.ApiLevel=21
    Pkg.Revision=#{version}
    SystemImage.Abi=x86
    SystemImage.TagId=google_apis
    SystemImage.TagDisplay=Google APIs
  EOS

  depends_on "pizzahutuk/android/android-21"

  test do
    system "true"
  end
end
