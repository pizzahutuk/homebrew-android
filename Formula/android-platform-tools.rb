# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class AndroidPlatformTools < AndroidToolFormula
  url "https://dl.google.com/android/repository/platform-tools_r24.0.4-macosx.zip"
  version "24.0.4"
  sha1 "43b8dd039fff5bb3fcc4e32f44feaa5aaff91cf0"

  depends_on "toonetown/android/android-sdk"

  def install
    (prefix/"platform-tools").install Dir["*"]
    install_tools prefix/"platform-tools"

    link_sdk_dir "platform-tools"
  end

  test do
    system "true"
  end
end
