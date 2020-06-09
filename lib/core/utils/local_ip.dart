/*
@author '彼时思默'
@time 20-5-30 上午11:29
@describe: 获取本地ip
*/
import 'dart:io';

Future<String> getLocalIp() async {
  var validNetNames = {
    "WLAN": true,
    "以太网": true,
    "Ethernet0": true,
    "wlan0": true,
    "eth0": true,
    "eth1": true,
    "es33": true,
    "enp4s0f1": true,
    "wlp3s0": true,
    "enp1s0": true,
    "enp4s0": true,
    "en0": true,
  };
  for (var interface in await NetworkInterface.list()) {
    if (validNetNames.containsKey(interface.name)) {
      return interface.addresses[0].address;
    }
  }
  return '';
}
