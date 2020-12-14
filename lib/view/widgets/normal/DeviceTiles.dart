/*
@author '彼时思默'
@time 20-5-18 上午11:00
@describe: 
*/
import 'package:flutter/material.dart';
import 'package:wormhole/server/redux.dart';
import 'package:wormhole/utils/box.dart';
import 'package:wormhole/view/widgets/base/textDroid.dart';

class DeviceTiles extends StatefulWidget {
  final String ip;
  final String name;
  final bool isEnable;

  DeviceTiles(this.ip, this.name, this.isEnable);

  @override
  _DeviceTilesState createState() => _DeviceTilesState(ip, name, isEnable);
}

class _DeviceTilesState extends State<DeviceTiles> {
  final String ip;
  final String name;
  final bool isEnable;
  final enableColor = Color(0xFF2FCB78);
  final disableColor = Color(0xFF9E9E9E);

  _DeviceTilesState(this.ip, this.name, this.isEnable);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFD8D8D8),
          ),
          right: BorderSide(
            width: 1,
            color: Color(0xFFD8D8D8),
          ),
        )),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFFD8D8D8),
            child: Icon(
              Icons.desktop_windows,
              color: this.isEnable ? enableColor : disableColor,
            ),
          ),
          title: TextDroid("$ip($name)"),
          selected: ip == box.get("select_ip") ? true : false,
          onTap: () => {
          setState(() => {box.put("select_ip", ip) })
          },
//          trailing: Switch(
//              value: true,
//              activeColor: Color(0xFF2AC875),
//              onChanged: (bool value) {
//                setState(() {
//                  enableDevices.remove(name);
//                  disableDevices.add(name);
//                });
//              }),
        ));
  }
}
