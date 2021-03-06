# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class AndroidBuildTools2703 < AndroidToolFormula
  url "https://dl.google.com/android/repository/build-tools_r27.0.3-macosx.zip"
  version "27.0.3"
  sha1 "61d9fb18790c68d66ff73bf1e7ad56bc1f1eef2d"

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
