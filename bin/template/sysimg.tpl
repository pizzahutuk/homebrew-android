require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-sdk-formula") unless defined?(android_sdk_formula)

class Android%%API_VERSION%%Sysimg%%SHORT_ABI%% < AndroidSysimgFormula
%%ARCHIVE_INFO%%
  api_version "%%API_VERSION%%"
  abi "%%LONG_ABI%%"
  sysimg_tag "/%%SYSIMG_TAG%%"

  src_properties <<~EOS
    AndroidVersion.ApiLevel=%%API_VERSION%%
    Pkg.Revision=#{version}
    SystemImage.Abi=%%LONG_ABI%%
    SystemImage.TagId=%%SYSIMG_TAG%%%%SYSIMG_TAG_DISPLAY%%
  EOS

  test do
    system "true"
  end
end
