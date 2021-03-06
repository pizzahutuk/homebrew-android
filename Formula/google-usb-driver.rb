# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-tool-formula") unless defined?(android_tool_formula)

class GoogleUsbDriver < AndroidToolFormula
  desc "USB Driver for Windows, revision 11"
  url "https://dl.google.com/android/repository/usb_driver_r11-windows.zip"
  version "11"
  sha1 "dc8a2ed2fbd7246d4caf9ab10ffe7749dc35d1cc"
  depends_on "pizzahutuk/android/android-sdk"

  def install
    (prefix/"extras/google/usb_driver").install Dir["*"]
    install_tools prefix/"extras/google/usb_driver"

    src_prop = prefix/"extras/google/usb_driver/source.properties"
    src_prop.delete if src_prop.exist?
    src_prop.write <<~EOS
      Extra.VendorId=google
      Extra.Path=usb_driver
      Pkg.Revision=#{version}
    EOS

    link_sdk_dir "extras/google"
  end

  test do
    system "true"
  end
end
