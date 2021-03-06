require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis26SysimgI386 < AndroidSysimgFormula
  desc "Google APIs Intel x86 Atom System Image"
  url "https://dl.google.com/android/repository/sys-img/google_apis/x86-26_r10.zip"
  version "10"
  sha1 "cdef9b36549d156c417c91929eb8e205de8825c9"
  api_version "26"
  abi "x86"
  sysimg_tag "/google_apis"

  src_properties <<~EOS
    AndroidVersion.ApiLevel=26
    Pkg.Revision=#{version}
    SystemImage.Abi=x86
    SystemImage.TagId=google_apis
    SystemImage.TagDisplay=Google APIs
  EOS

  depends_on "pizzahutuk/android/android-26"

  test do
    system "true"
  end
end
