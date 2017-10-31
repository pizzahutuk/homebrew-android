# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class AndroidBuildTools2102 < AndroidToolFormula
  url "https://dl.google.com/android/repository/build-tools_r21.0.2-macosx.zip"
  version "21.0.2"
  sha1 "f17471c154058f3734729ef3cc363399b1cd3de1"

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
