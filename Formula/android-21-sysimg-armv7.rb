require 'pathname'
require Pathname(__FILE__).realpath.dirname.join('../lib', 'android-sdk-formula')

class Android21SysimgArmv7 < AndroidSysimgFormula
  url 'http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_arm-21_r03.zip'
  version '3'
  sha1 '0b2e21421d29f48211b5289ca4addfa7f4c7ae5a'
  api_version '21'
  abi 'armeabi-v7a'
end
