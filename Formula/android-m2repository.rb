# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula")

class AndroidM2repository < AndroidToolFormula
  desc "Local Maven repository for Support Libraries"
  url "https://dl.google.com/android/repository/android_m2repository_r32.zip"
  version "32.0.0"
  sha1 "3edb7650480cf86af94b478ffc00a94731a9a1b6"
  depends_on "toonetown/android/android-sdk"

  def install
    (prefix/"extras/android/m2repository").install Dir["*"]
    install_tools prefix/"extras/android/m2repository"

    src_prop = prefix/"extras/android/m2repository/source.properties"
    src_prop.delete if src_prop.exist?
    src_prop.write <<-EOS.undent
      Extra.VendorId=android
      Extra.Path=m2repository
      Pkg.Revision=#{version}
    EOS

    link_sdk_dir "extras/android"
  end

  test do
    system "true"
  end
end
