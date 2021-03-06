require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class Android23 < AndroidPlatformFormula
  desc "Android SDK Platform 23"
  url "https://dl.google.com/android/repository/platform-23_r03.zip"
  version "3"
  sha1 "027fede3de6aa1649115bbd0bffff30ccd51c9a0"
  api_version "23"
  target_directory "platforms"
  target_name      "android"

  # Dependencies for docs, sources, and samples
  sources ["pizzahutuk/android/android-23-sources"]

  test do
    system "true"
  end
end
