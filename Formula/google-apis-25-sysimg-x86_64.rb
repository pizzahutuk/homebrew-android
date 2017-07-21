require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis25SysimgX8664 < AndroidSysimgFormula
  desc "Google APIs Intel x86 Atom_64 System Image"
  url "https://dl.google.com/android/repository/sys-img/google_apis/x86_64-25_r07.zip"
  version "7"
  sha1 "0faa9028b1967c55e7f7cd19544980430b6f2c8a"
  api_version "25"
  abi "x86_64"
  sysimg_tag "/google_apis"

  src_properties <<-EOS.undent
    AndroidVersion.ApiLevel=25
    Pkg.Revision=#{version}
    SystemImage.Abi=x86_64
    SystemImage.TagId=google_apis
    SystemImage.TagDisplay=Google APIs
  EOS

  depends_on "toonetown/android/android-25"

  test do
    system "true"
  end
end
