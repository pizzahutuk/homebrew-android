require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class Android8 < AndroidPlatformFormula
  desc "Android SDK Platform 8"
  url "https://dl.google.com/android/repository/android-2.2_r03.zip"
  version "3"
  sha1 "231262c63eefdff8fd0386e9ccfefeb27a8f9202"
  api_version "8"
  target_directory "platforms"
  target_name      "android"

  # Dependencies for docs, sources, and samples

  test do
    system "true"
  end
end
