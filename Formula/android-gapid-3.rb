# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula")

class AndroidGapid3 < AndroidToolFormula
  desc "Tools that support GPU debugging and profiling within an IDE."
  url "https://dl.google.com/android/repository/gapid_2994895_linux.zip"
  version "3.1.0"
  sha1 "a33fe37c87b095171d647385445abe164ae03514"
  depends_on "toonetown/android/android-sdk"

  def install
    (prefix/"extras/android/gapid_3").install Dir["*"]
    install_tools prefix/"extras/android/gapid_3"

    src_prop = prefix/"extras/android/gapid_3/source.properties"
    src_prop.delete if src_prop.exist?
    src_prop.write <<-EOS.undent
      Extra.VendorId=android
      Extra.Path=gapid_3
      Pkg.Revision=#{version}
    EOS

    link_sdk_dir "extras/android"
  end

  test do
    system "true"
  end
end