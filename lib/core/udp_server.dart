/*
@author '彼时思默'
@time 20-12-9 下午2:18
@describe:
*/
import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:wormhole/entity/event.dart';
import 'package:wormhole/entity/message.dart';
import 'package:wormhole/generated/redux.pb.dart';


udpServer() {
  RawDatagramSocket.bind("0.0.0.0", 10808)
      .then((RawDatagramSocket udpSocket) {
    udpSocket.listen((event) {
      if (event == RawSocketEvent.read) {
        Datagram dg = udpSocket.receive();
        var msg = UdpMsg.fromJson(json.decode(utf8.decode(dg.data)));
        switch (msg.heat.event) {
          case InfoEvent.respondEvent:
            udpSend(msg.heat.host, InfoEvent.respondEvent);
            continue addDevice;
          case InfoEvent.offlineEvent:
          addDevice:
          case InfoEvent.respondEvent:
            //Todo:事件处理
            break;
          case InfoEvent.repeatEvent:
            break;
        }
      }
    });
  });
}

udpSend(dynamic addr, String event) {
  RawDatagramSocket.bind("localhost", 10808 + 1)
      .then((RawDatagramSocket udpSocket) async {
    var box = await Hive.openBox("default");
    var heat = Heat();
    heat.host = box.get("self_host");
    heat.name = box.get("self_name");
    heat.port = box.get("self_port");
    heat.event = event;
    var udpMessage = UdpMsg(heat);
    udpSocket.send(utf8.encode(json.encode(udpMessage)),
        addr is InternetAddress ? addr : InternetAddress(addr), 10808);
    return;
  });
}

broadcast() async {
  udpSend(InternetAddress.anyIPv4, InfoEvent.broadcastEvent);
}
