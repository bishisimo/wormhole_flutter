// /*
// @author '彼时思默'
// @time 20-5-30 下午1:30
// @describe: 记录所需信息
// */
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/widgets.dart';
// import 'package:wormhole/entity/device.dart';
// import 'package:wormhole/entity/message.dart';
//
// class Redux {
//   // 工厂模式
//   factory Redux() => _getInstance();
//
//   static Redux get instance => _getInstance();
//   static Redux _instance;
//
//   static Redux _getInstance() {
//     if (_instance == null) {
//       _instance = new Redux._internal();
//     }
//     return _instance;
//   }
//
//   var acceptDir = "./accept/";
//   var myIp="127.0.0.1";
//   var myName="user";
//   var messageStr="暂无消息";
//   Map<String, Device> devices={};
//   Map<String, File> files = {};
//   String selectIp = "127.0.0.1";
//   int tcpPort = 8085;
//   int udpPort = 18552;
//   State state;
//
//   Redux._internal(){
//     var directory = new Directory(acceptDir);
//     if (!directory.existsSync()) {
//       directory.createSync(recursive: true);
//     }
//   }
//
//   hasDevice(String addr){
//     return devices.containsKey(addr);
//   }
//
//   online(String addr, [String name]) {
//     if (devices.containsKey(addr)) {
//       devices[addr].isOnline = true;
//       if (name != null) {
//         devices[addr].name = name;
//       }
//     } else if (!devices.containsKey(addr)) {
//       devices[addr] =
//           Device(addr, name != null ? name : "${DateTime.now()}".split(".")[0]);
//     }
//   }
//
//   offline(String addr) {
//     if (devices.containsKey(addr)) {
//       devices[addr].isOnline = false;
//     }
//   }
//
//   tcpServer() {
//     ServerSocket.bind('0.0.0.0', Redux().tcpPort).then((serverSocket) {
//       serverSocket.listen((socket) {
//         socket.listen((s) {
//           var data = utf8.decode(s);
//           int idxStart = data.indexOf("{");
//           int idxEnd = 0;
//           while (data.contains("}", idxEnd)) {
//             idxEnd = data.indexOf("}", idxEnd) + 1;
//             if (idxStart >= idxEnd) {
//               continue; // 找下一个 "}"
//             }
//             var sJSON = data.substring(idxStart, idxEnd);
//             idxStart = idxEnd;
//             var jsonBody = json.decode(sJSON);
//             serverHandle(socket,jsonBody);
//           }
//         });
//       });
//     });
//   }
//
//   serverHandle(Socket socket, dynamic jsonBody) {
//     var msg = TcpMessage.fromJson(jsonBody);
//     state.setState(() {
//     switch (msg.type) {
//       case "string":
//         var addr = socket.remoteAddress.address;
//         var name = devices[addr].name;
//         var timePoint=DateTime.now().toString().split(".")[0];
//         var msgContext="$timePoint>$addr($name):\n${utf8.decode(msg.content)}";
// //        state.setState(() {
//           messageStr=msgContext;
// //        });
//         break;
//       case "file":
//         var sp = msg.sendPath.split("/");
//         if (sp.length == 1) {
//           sp = msg.sendPath.split("\\");
//         }
//         var fileName = sp[sp.length - 1];
//         var filePath = acceptDir + fileName;
//         switch (msg.status) {
//           case "start":
//             var file = File(filePath + ".tmp");
//             files[filePath] = file;
//             var offset = getOffset(file);
//             socket.write(offset);
//             break;
//           case "send":
//           // var sha1Value=sha1.convert(msg.content).bytes;
//           // print("sha:${sha1Value==msg.sha1Value},${sha1Value[0]},${msg.sha1Value[0]}");
//             if (msg.contentLen == msg.content.length) {
//               var file = files[filePath];
//               file.writeAsBytesSync(msg.content, mode: FileMode.writeOnlyAppend);
//             } else {
//               socket.write("error");
//             }
//             break;
//           case "end":
//             var file = files[filePath];
//             file.rename(filePath);
//             socket.write("ok");
//             return;
//         }
//         break;
//     }
//     });
//
//   }
//
//   int getOffset(File file) {
//     if (file.existsSync()) {
//       return file.statSync().size;
//     }
//     return 0;
//   }
//
//
//   sendFileByPath(String filePath) {
//     var file = File(filePath);
//     if (!file.existsSync()) {
//       return;
//     } else {
//       print(file.statSync().size);
//     }
//     var index = 0;
//     var data = TcpMessage("file", index, filePath, "start", null);
//     int offset;
//     String status;
//     Stream<List<int>> streams;
//     Socket.connect(selectIp, tcpPort).then((socket) => {
//       socket.write(json.encode(data)),
//       socket.listen((event) {
//         status = utf8.decode(event);
//         try {
//           offset = int.parse(status);
//           streams = file.openRead(offset);
//           streams.listen((event) {
//             index++;
//             data = TcpMessage("file", index, filePath, "send", event);
//             socket.write(json.encode(data));
//           }, onDone: () {
//             data = TcpMessage("file", 2, filePath, "end", null);
//             socket.write(json.encode(data));
//             print("send over");
//           });
//         } catch (e) {
//           return;
//         }
//       }),
//     });
//   }
//
//   sendString(String messageStr){
//     var msg=TcpMessage("string", 0, null, "send", utf8.encode(messageStr));
//
//     Socket.connect(selectIp, tcpPort).then((socket) => {
//       socket.write(json.encode(msg))
//     }
//     );
//   }
//
//   udpServer() {
//     RawDatagramSocket.bind("0.0.0.0", udpPort)
//         .then((RawDatagramSocket udpSocket) {
//       udpSocket.listen((event) {
//         if (event == RawSocketEvent.read) {
//           Datagram dg = udpSocket.receive();
//           var msg=UdpMsg.fromJson(json.decode(utf8.decode(dg.data)));
//           state.setState(() {
//             switch (msg.event){
//               case "online":
//                 if (Redux().hasDevice(dg.address.address)){
//                   Redux().devices[dg.address.address].isOnline=true;
//                 }else{
//                   var device=Device(dg.address.address,msg.name);
//                   Redux().devices[dg.address.address]=device;
//                 }
//                 var sendMsg=UdpMsg("reply",Redux().myName);
//                 udpSend(sendMsg,dg.address.address);
//                 break;
//               case "offline":
//                 if (Redux().hasDevice(dg.address.address)){
//                   Redux().devices[dg.address.address].isOnline=false;
//                 }
//                 break;
//               case "reply":
//                 if (Redux().hasDevice(dg.address.address)){
//                   Redux().devices[dg.address.address].isOnline=true;
//                 }else{
//                   var device=Device(dg.address.address,msg.name);
//                   Redux().devices[dg.address.address]=device;
//                 }
//                 break;
//               case "rename":
//                 if (Redux().hasDevice(dg.address.address)){
//                   Redux().devices[dg.address.address].isOnline=true;
//                   Redux().devices[dg.address.address].name=msg.name;
//                 }
//                 break;
//             }
//           });
//         }
//       });
//     });
//   }
//
//   udpSend(UdpMsg msg, dynamic addr) {
//     RawDatagramSocket.bind("localhost", udpPort+1)
//         .then((RawDatagramSocket udpSocket) {
// //       udpSocket.broadcastEnabled=true;
//       udpSocket.send(utf8.encode(json.encode(msg)), addr is InternetAddress?addr:InternetAddress(addr), udpPort);
// //      return;
//     });
//   }
//
//   broadcast(String event){
//     var msg=UdpMsg(event,Redux().myName);
//     udpSend(msg,InternetAddress.anyIPv4);
//   }
// }
