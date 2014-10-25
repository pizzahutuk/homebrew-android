require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android17SysimgMips < AndroidSysimgFormula
  url 'http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_mips-17_r01.zip'
  version '1'
  sha1 'f0c6e153bd584c29e51b5c9723cfbf30f996a05d'
  api_version '17'
  abi 'mips'
end
