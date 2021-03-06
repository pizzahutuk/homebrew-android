require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis21SysimgX8664 < AndroidSysimgFormula
  desc "Google APIs Intel x86 Atom_64 System Image"
  url "https://dl.google.com/android/repository/sys-img/google_apis/x86_64-21_r27.zip"
  version "27"
  sha1 "b70d2ebd9d0a972d0f746e325d66914bc059af09"
  api_version "21"
  abi "x86_64"
  sysimg_tag "/google_apis"

  src_properties <<~EOS
    AndroidVersion.ApiLevel=21
    Pkg.Revision=#{version}
    SystemImage.Abi=x86_64
    SystemImage.TagId=google_apis
    SystemImage.TagDisplay=Google APIs
  EOS

  depends_on "pizzahutuk/android/android-21"

  test do
    system "true"
  end
end
