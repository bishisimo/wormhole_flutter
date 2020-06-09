/*
@author '彼时思默'
@time 20-5-21 下午1:03
@describe: 
*/
/*
@author '彼时思默'
@time 20-5-18 上午11:00
@describe: 显示接受到的消息
*/
import 'package:flutter/material.dart';
import 'package:wormhole/core/server/redux.dart';

class MessageAccept extends StatefulWidget {
  @override
  _MessageAcceptState createState() => _MessageAcceptState();
}

class _MessageAcceptState extends State<MessageAccept> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            width: 2,
            color: Colors.blue.shade100,
          ),
          top: BorderSide(
            width: 1,
            color: Colors.blue.shade100,
          ),
          left: BorderSide(
            width: 1,
            color: Color(0xFFD8D8D8),
          ),
        )),
        child: Center(
            child: SelectableText(Redux().messageStr,
                style: TextStyle(fontFamily: "Droid"),
                textAlign: TextAlign.center,
                enableInteractiveSelection: true,
//                scrollPhysics: ClampingScrollPhysics(),
                toolbarOptions: ToolbarOptions(copy: true, selectAll: true))));
  }
}
