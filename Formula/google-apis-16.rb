require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis16 < AndroidPlatformFormula
  desc "Android + Google APIs"
  url "https://dl.google.com/android/repository/google_apis-16_r04.zip"
  version "4"
  sha1 "ee6acf1b01020bfa8a8e24725dbc4478bee5e792"
  api_version "16"
  target_directory "add-ons"
  target_name      "addon-google_apis-google"

  src_properties <<~EOS
    Addon.NameId=google_apis
    Addon.VendorId=google
    AndroidVersion.ApiLevel=16
    Pkg.Revision=#{version}
  EOS

  depends_on "pizzahutuk/android/android-16"

  test do
    system "true"
  end
end
