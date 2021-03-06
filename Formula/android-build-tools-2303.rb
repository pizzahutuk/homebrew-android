# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class AndroidBuildTools2303 < AndroidToolFormula
  url "https://dl.google.com/android/repository/build-tools_r23.0.3-macosx.zip"
  version "23.0.3"
  sha1 "fbc98cd303fd15a31d472de6c03bd707829f00b0"

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
