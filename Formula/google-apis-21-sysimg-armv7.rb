require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class GoogleApis21SysimgArmv7 < AndroidSysimgFormula
  desc "Google APIs ARM EABI v7a System Image"
  url "https://dl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-21_r27.zip"
  version "27"
  sha1 "89fc31c17d9cb933dc68f4cae23858f3eb057c15"
  api_version "21"
  abi "armeabi-v7a"
  sysimg_tag "/google_apis"

  src_properties <<~EOS
    AndroidVersion.ApiLevel=21
    Pkg.Revision=#{version}
    SystemImage.Abi=armeabi-v7a
    SystemImage.TagId=google_apis
    SystemImage.TagDisplay=Google APIs
  EOS

  depends_on "pizzahutuk/android/android-21"

  test do
    system "true"
  end
end
