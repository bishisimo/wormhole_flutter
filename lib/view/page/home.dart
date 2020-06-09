/*
@author '彼时思默'
@time 20-5-18 上午10:01
@describe:
*/
import 'package:flutter/material.dart';
import 'package:wormhole/core/server/redux.dart';
import 'package:wormhole/view/widgets/future/add_net.dart';
import 'package:wormhole/view/widgets/normal/DeviceTiles.dart';
import 'package:wormhole/view/widgets/normal/fileDrop.dart';
import 'package:wormhole/view/widgets/base/textDroid.dart';
import 'package:wormhole/view/widgets/base/titleTitle.dart';
import 'package:wormhole/view/widgets/normal/message_accept.dart';
import 'package:wormhole/view/widgets/base/userTile.dart';
import 'package:wormhole/view/widgets/normal/wirteContent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> devicesOnline = [];
  List<Widget> devicesOffline = [];
  refreshDevices(){
    setState(() {
      devicesOnline=createTiles(true);
      devicesOffline=createTiles(false);
    });
  }

  bool isHideEnable = false;
  bool isHideDisable = false;
  bool isFirstRefresh=true;
//  _HomePageState(){
//
//  }
  @override
  Widget build(BuildContext context) {
    if(isFirstRefresh){
      isFirstRefresh=false;
      Redux().state=this;
      Redux().udpServer();
      Redux().tcpServer();
      Redux().broadcast("online");
    }
    refreshDevices();
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 191,
            child: Column(
              children: [
                UserTile(),
                Container(
                  color: Colors.grey,
                  child: ListTile(
                    leading: TextDroid("添加网络:"),
                    title: AddNetTextField(),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      TitleTiTle("已连接设备", changeEnable, Colors.cyan),
                      ...devicesOnline,
                      TitleTiTle('未连接设备', changeDisable),
                      ...devicesOffline,
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 309,
              child: Column(
                children: [
                  Expanded(flex: 309, child: FileDrop()),
                  Expanded(
                      flex: 191,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 191, child: MessageAccept()),
                          Expanded(flex: 309, child: WritContent())
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
  

  List<Widget> createTiles(bool isOnline) {
    if (isHideEnable && isOnline || isHideDisable && !isOnline) {
      return [];
    }
    List<Widget> tiles = [];
//    var devices = isEnable ? devicesOnline : devicesOffline;
    Redux().devices.forEach((key, value) {
      if (isOnline==value.isOnline){
        tiles.add(DeviceTiles(key,value.name, isOnline));
      }
    });
    if (tiles.length == 0) {
      tiles.add(Container(
        height: 30,
        alignment: Alignment.center,
        child: TextDroid('暂无设备'),
      ));
    }
    return tiles;
  }

  changeEnable() {
    setState(() => {isHideEnable = !isHideEnable});
  }

  changeDisable() {
    setState(() => {isHideDisable = !isHideDisable});
  }
}
