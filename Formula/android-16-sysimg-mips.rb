require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android16SysimgMips < AndroidSysimgFormula
  url 'http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_mips-16_r04.zip'
  version '4'
  sha1 '67943c54fb3943943ffeb05fdd39c0b753681f6e'
  api_version '16'
  abi 'mips'
end
