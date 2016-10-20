# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class AndroidBuildTools2500 < AndroidToolFormula
  url "https://dl.google.com/android/repository/build-tools_r25-macosx.zip"
  version "25.0.0"
  sha1 "273c5c29a65cbed00e44f3aa470bbd7dce556606"

  depends_on "toonetown/android/android-sdk"
  depends_on "toonetown/android/android-platform-tools"

  def install
    (prefix/"build-tools"/version).install Dir["*"]
    install_tools prefix/"build-tools"/version

    link_sdk_dir "build-tools"
  end

  test do
    system "true"
  end
end
