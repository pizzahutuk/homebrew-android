require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis10 < AndroidPlatformFormula
  desc "Android + Google APIs"
  url "https://dl.google.com/android/repository/google_apis-10_r02.zip"
  version "2"
  sha1 "cc0711857c881fa7534f90cf8cc09b8fe985484d"
  api_version "10"
  target_directory "add-ons"
  target_name      "addon-google_apis-google"

  src_properties <<~EOS
    Addon.NameId=google_apis
    Addon.VendorId=google
    AndroidVersion.ApiLevel=10
    Pkg.Revision=#{version}
  EOS

  depends_on "pizzahutuk/android/android-10"

  test do
    system "true"
  end
end
