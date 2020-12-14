// /*
// @author '彼时思默'
// @time 20-12-9 下午2:17
// @describe:
// */
// // class Redux {
// //   var messageStr="暂无消息";
// //   Map<String, Device> devices={};
// //   String selectIp = "127.0.0.1";
// //   State state;
// //   // 工厂模式
// //   factory Redux() => _getInstance();
// //
// //   static Redux get instance => _getInstance();
// //   static Redux _instance;
// //
// //   static Redux _getInstance() {
// //     if (_instance == null) {
// //       _instance = new Redux._internal();
// //     }
// //     return _instance;
// //   }
// //   Redux._internal(){
// //     var acceptDir = "./accept/";
// //     var myIp="127.0.0.1";
// //     var myName="user";
// //     var messageStr="暂无消息";
// //     Map<String, Device> devices={};
// //     Map<String, File> files = {};
// //     String selectIp = "127.0.0.1";
// //     int tcpPort = 8085;
// //     int udpPort = 18552;
// //     State state;
// //   }
// // }
// import 'dart:async';
//
// import 'package:grpc/src/server/call.dart';
// import 'package:wormhole/generated/redux.pb.dart';
// import 'package:wormhole/generated/redux.pbgrpc.dart';
// class ReduxService extends  ReduxServiceBase{
//
//
//   @override
//   Future<Reply> beatHeat(ServiceCall call, Heat request) {
//     // TODO: implement beatHeat
//     throw UnimplementedError();
//   }
//
//   @override//兼容远程本地调用
//   Future<Reply> checkHealth(ServiceCall call, Empty request) {
//     // TODO: implement checkHealth
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Device> getDevice(ServiceCall call, DeviceKey request) {
//     // TODO: implement getDevice
//     throw UnimplementedError();
//   }
//
//   @override
//   Stream<Message> getMessageStream(ServiceCall call, Empty request) {
//     // TODO: implement getMessageStream
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<ListResponse> listDevice(ServiceCall call, Empty request) {
//     // TODO: implement listDevice
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Reply> restart(ServiceCall call, Empty request) {
//     // TODO: implement restart
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Reply> sendFile(ServiceCall call, Stream<FileMessage> request) {
//     // TODO: implement sendFile
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Reply> sendText(ServiceCall call, TextMessage request) {
//     // TODO: implement sendText
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Reply> snapshot(ServiceCall call, Empty request) {
//     // TODO: implement snapshot
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Reply> stop(ServiceCall call, Empty request
//       ) {
//     // TODO: implement stop
//     throw UnimplementedError();
//   }
//
// }
