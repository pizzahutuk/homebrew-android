# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class AndroidBuildTools2111 < AndroidToolFormula
  url "https://dl.google.com/android/repository/build-tools_r21.1.1-macosx.zip"
  version "21.1.1"
  sha1 "836a146eab0504aa9387a5132e986fe7c7381571"

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
