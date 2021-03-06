# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class GooglePlayServices < AndroidToolFormula
  desc "Google Play services Javadocs and sample code"
  url "https://dl.google.com/android/repository/google_play_services_v15_1_rc12.zip"
  version "48"
  sha1 "4bf33f904ef11b50493a55cfddbcd3138f72f681"
  depends_on "pizzahutuk/android/android-sdk"

  def install
    (prefix/"extras/google/google_play_services").install Dir["*"]
    install_tools prefix/"extras/google/google_play_services"

    src_prop = prefix/"extras/google/google_play_services/source.properties"
    src_prop.delete if src_prop.exist?
    src_prop.write <<~EOS
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
