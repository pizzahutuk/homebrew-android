require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis5 < AndroidPlatformFormula
  desc "Android + Google APIs"
  url "https://dl.google.com/android/repository/google_apis-5_r01.zip"
  version "1"
  sha1 "46eaeb56b645ee7ffa24ede8fa17f3df70db0503"
  api_version "5"
  target_directory "add-ons"
  target_name      "addon-google_apis-google"

  src_properties <<~EOS
    Addon.NameId=google_apis
    Addon.VendorId=google
    AndroidVersion.ApiLevel=5
    Pkg.Revision=#{version}
  EOS

  depends_on "pizzahutuk/android/android-5"

  test do
    system "true"
  end
end
