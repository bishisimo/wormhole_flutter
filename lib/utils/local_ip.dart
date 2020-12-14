/*
@author '彼时思默'
@time 20-5-30 上午11:29
@describe: 获取本地ip
*/
import 'dart:io';

var _ip = "";

Future<String> getLocalIp() async {
  if (_ip != "") {
    return _ip;
  }
  const _regExp = r".*WLAN|以太网|Ethernet|eth.*|enp.*|es.*|wlp|en0.*";
  for (var interface in await NetworkInterface.list()) {
    if (RegExp(_regExp).hasMatch(interface.name)) {
      _ip = interface.addresses[0].address;
      return _ip;
    }
  }
  return _ip;
}
