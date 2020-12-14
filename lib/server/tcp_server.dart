// /*
// @author '彼时思默'
// @time 20-5-30 下午2:25
// @describe:
// */
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/widgets.dart';
// import 'package:wormhole/entity/message.dart';
// import 'package:wormhole/server/redux.dart';
//
//
//
// serverHandle(Socket socket, State that,Map<String, dynamic> jsonBody) {
//   var msg = TcpMessage.fromJson(jsonBody);
//   switch (msg.type) {
//     case "string":
//       var addr = socket.remoteAddress.address;
//       var name = Redux().devices[addr].name;
//       var msgContext="$addr($name): ${utf8.decode(msg.content)}";
//       that.setState(() {
//         Redux().messageStr=msgContext;
//       });
//       break;
//     case "file":
//       var sp = msg.sendPath.split("/");
//       if (sp.length == 1) {
//         sp = msg.sendPath.split("\\");
//       }
//       var fileName = sp[sp.length - 1];
//       var filePath = Redux().acceptDir + fileName;
//       switch (msg.status) {
//         case "start":
//           var file = File(filePath + ".tmp");
//           Redux().files[filePath] = file;
//           var offset = getOffset(file);
//           socket.write(offset);
//           break;
//         case "send":
//           // var sha1Value=sha1.convert(msg.content).bytes;
//           // print("sha:${sha1Value==msg.sha1Value},${sha1Value[0]},${msg.sha1Value[0]}");
//           if (msg.contentLen == msg.content.length) {
//             var file = Redux().files[filePath];
//             file.writeAsBytesSync(msg.content, mode: FileMode.writeOnlyAppend);
//           } else {
//             socket.write("error");
//           }
//
//           break;
//         case "end":
//           var file = Redux().files[filePath];
//           file.rename(filePath);
//           socket.write("ok");
//           return;
//       }
//       break;
//   }
// }
//
// int getOffset(File file) {
//   if (file.existsSync()) {
//     return file.statSync().size;
//   }
//   return 0;
// }
