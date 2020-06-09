/*
@author '彼时思默'
@time 20-5-30 下午8:23
@describe:
*/
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wormhole/core/entity/device.dart';
import 'package:wormhole/core/entity/message.dart';
import 'package:wormhole/core/server/redux.dart';


var udpPort = 12326;

udpServer(State that) {
  RawDatagramSocket.bind("0.0.0.0", udpPort)
      .then((RawDatagramSocket udpSocket) {
    udpSocket.listen((event) {
      if (event == RawSocketEvent.read) {
        Datagram dg = udpSocket.receive();
        var msg=UdpMsg.fromJson(json.decode(utf8.decode(dg.data)));
        that.setState(() {
          switch (msg.event){
            case "online":
              if (Redux().hasDevice(dg.address.address)){
                Redux().devices[dg.address.address].isOnline=true;
              }else{
                var device=Device(dg.address.address,msg.name);
                Redux().devices[dg.address.address]=device;
              }
              var sendMsg=UdpMsg("reply",Redux().myName);
              udpSend(sendMsg,dg.address.address);
              break;
            case "offline":
              if (Redux().hasDevice(dg.address.address)){
                Redux().devices[dg.address.address].isOnline=false;
              }
              break;
            case "reply":
              if (Redux().hasDevice(dg.address.address)){
                Redux().devices[dg.address.address].isOnline=true;
              }else{
                var device=Device(dg.address.address,msg.name);
                Redux().devices[dg.address.address]=device;
              }
              break;
            case "rename":
              if (Redux().hasDevice(dg.address.address)){
                Redux().devices[dg.address.address].isOnline=true;
                Redux().devices[dg.address.address].name=msg.name;
              }
              break;
          }
        });
      }
    });
  });
}

udpSend(UdpMsg msg, dynamic addr) {
  RawDatagramSocket.bind("localhost", udpPort+1)
      .then((RawDatagramSocket udpSocket) {
    // udpSocket.broadcastEnabled=true;
    udpSocket.send(utf8.encode(json.encode(msg)), addr is InternetAddress?addr:InternetAddress(addr), udpPort);
    return;
  });
}

broadcast(String event){
  var msg=UdpMsg(event,Redux().myName);
  udpSend(msg,InternetAddress.anyIPv4);
}