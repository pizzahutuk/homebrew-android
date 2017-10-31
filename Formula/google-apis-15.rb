require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis15 < AndroidPlatformFormula
  desc "Android + Google APIs"
  url "https://dl.google.com/android/repository/google_apis-15_r03.zip"
  version "3"
  sha1 "d0d2bf26805eb271693570a1aaec33e7dc3f45e9"
  api_version "15"
  target_directory "add-ons"
  target_name      "addon-google_apis-google"

  src_properties <<-EOS.undent
    Addon.NameId=google_apis
    Addon.VendorId=google
    AndroidVersion.ApiLevel=15
    Pkg.Revision=#{version}
  EOS

  depends_on "pizzahutuk/android/android-15"

  test do
    system "true"
  end
end
