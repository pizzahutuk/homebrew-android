require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class Android27Sources < AndroidSourcesFormula
  url "https://dl.google.com/android/repository/sources-27_r01.zip"
  version "1"
  sha1 "7b714670561d08f54751af42aca929867b806596"
  api_version "27"
  target_directory "sources"
  target_name      "android"

  test do
    system "true"
  end
end
