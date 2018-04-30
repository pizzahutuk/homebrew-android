require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class Android23SysimgI386 < AndroidSysimgFormula
  desc "Intel x86 Atom System Image"
  url "https://dl.google.com/android/repository/sys-img/android/x86-23_r10.zip"
  version "10"
  sha1 "f6c3e3dd7bd951454795aa75c3a145fd05ac25bb"
  api_version "23"
  abi "x86"
  sysimg_tag "/default"

  src_properties <<~EOS
    AndroidVersion.ApiLevel=23
    Pkg.Revision=#{version}
    SystemImage.Abi=x86
    SystemImage.TagId=default
  EOS

  test do
    system "true"
  end
end
