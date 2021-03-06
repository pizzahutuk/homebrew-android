# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class AndroidDocs < AndroidToolFormula
  url "https://dl.google.com/android/repository/docs-24_r01.zip"
  version "24-r1"
  sha1 "eef58238949ee9544876cb3e002f2d58e4ee7b5d"

  depends_on "pizzahutuk/android/android-sdk"

  def install
    (prefix/"docs").install Dir["*"]
    install_tools prefix/"docs"
    link_sdk_dir "docs"
  end

  test do
    system "true"
  end
end
