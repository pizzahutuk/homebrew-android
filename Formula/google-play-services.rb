# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class GooglePlayServices < AndroidToolFormula
  desc "Google Play services Javadocs and sample code"
  url "https://dl.google.com/android/repository/google_play_services_v7_rc28.zip"
  version "37"
  sha1 "20b7d0b69c166161bf9aa95df1f58404a8733171"
  depends_on "toonetown/android/android-sdk"

  def install
    (prefix/"extras/google/google_play_services").install Dir["*"]
    install_tools prefix/"extras/google/google_play_services"

    src_prop = prefix/"extras/google/google_play_services/source.properties"
    src_prop.delete if src_prop.exist?
    src_prop.write <<-EOS.undent
      Extra.VendorId=google
      Extra.Path=google_play_services
      Pkg.Revision=#{version}
    EOS

    link_sdk_dir "extras/google"
  end

  test do
    system "true"
  end
end
