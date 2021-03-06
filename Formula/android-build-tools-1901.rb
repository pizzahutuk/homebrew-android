# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class AndroidBuildTools1901 < AndroidToolFormula
  url "https://dl.google.com/android/repository/build-tools_r19.0.1-macosx.zip"
  version "19.0.1"
  sha1 "efaf50fb19a3edb8d03efbff76f89a249ad2920b"

  depends_on "pizzahutuk/android/android-sdk"
  depends_on "pizzahutuk/android/android-platform-tools"

  def install
    (prefix/"build-tools"/version).install Dir["*"]
    install_tools prefix/"build-tools"/version

    link_sdk_dir "build-tools"
  end

  test do
    system "true"
  end
end
