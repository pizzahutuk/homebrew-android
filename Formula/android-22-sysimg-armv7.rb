require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula")

class Android22SysimgArmv7 < AndroidSysimgFormula
  desc "ARM EABI v7a System Image"
  url "https://dl.google.com/android/repository/sys-img/android/sysimg_arm-22_r01.zip"
  version "1"
  sha1 "2aa6a887ee75dcf3ac34627853d561997792fcb8"
  api_version "22"
  abi "armeabi-v7a"
  sysimg_tag "/default"

  test do
    system "true"
  end
end
