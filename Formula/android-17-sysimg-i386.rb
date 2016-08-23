require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class Android17SysimgI386 < AndroidSysimgFormula
  desc "Intel x86 Atom System Image"
  url "https://dl.google.com/android/repository/sys-img/android/sysimg_x86-17_r02.zip"
  version "2"
  sha1 "bd8c7c5411431af7e051cbe961be430fc31e773d"
  api_version "17"
  abi "x86"
  sysimg_tag "/default"

  test do
    system "true"
  end
end
