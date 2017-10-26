# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class AndroidLldb30 < AndroidToolFormula
  desc "LLDB 3.0"
  url "https://dl.google.com/android/repository/lldb-3.0.4213617-darwin-x86_64.zip"
  version "3.0.4213617"
  sha1 "2492651690a215317b86c755cd4d584ec9838677"

  depends_on "toonetown/android/android-sdk"
  depends_on "toonetown/android/android-ndk"

  def install
    (prefix/"lldb"/"3.0").install Dir["*"]
    install_tools prefix/"lldb"/"3.0"

    pkg_xml = prefix/"lldb"/"3.0"/"package.xml"
    pkg_xml.delete if pkg_xml.exist?
    pkg_xml.write <<-EOS.undent
      <ns4:repository xmlns:ns4="http://schemas.android.com/repository/android/common/01">
        <localPackage obsolete="false" path="lldb;3.0">
          <revision>
            <major>#{version.to_s.split(".")[0]}</major>
            <minor>#{version.to_s.split(".")[1]}</minor>
            <micro>#{version.to_s.split(".")[2]}</micro>
          </revision>
          <display-name>#{desc}</display-name>
        </localPackage>
      </ns4:repository>
    EOS

    link_sdk_dir "lldb"
  end

  test do
    system "true"
  end
end
