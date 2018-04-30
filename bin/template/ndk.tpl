# This file is autogenerated by the generate-sdks.sh script

require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "android-ndk-formula") unless defined?(android_ndk_formula)

class AndroidNdk < AndroidNdkFormula
%%ARCHIVE_INFO%%
  revision ({
    "11c" => 1,
    "12" => 1,
  }[version.to_s])

  def caveats; <<~EOS
    We agreed to the Android NDK License Agreement for you by downloading the NDK.
    If this is unacceptable you should uninstall.

    License information at:
    https://developer.android.com/sdk/terms.html

    The Android-NDK location for IDEs such as Eclipse, IntelliJ etc is:
      #{prefix}

    You may need to add the following to your .bashrc:
      export ANDROID_NDK_HOME=#{opt_prefix}
    EOS
  end

  test do
    system "true"
  end
end
