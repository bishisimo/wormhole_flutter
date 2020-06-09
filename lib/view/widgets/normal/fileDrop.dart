/*
@author '彼时思默'
@time 20-5-21 下午1:02
@describe: 
*/
import 'package:flutter/material.dart';
import 'package:wormhole/view/widgets/base/textDroid.dart';
class FileDrop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xFFD8D8D8),
            ),
            left: BorderSide(
              width: 1,
              color: Color(0xFFD8D8D8),
            ),
          )),
      child: Center(
        child: GestureDetector(
          child: TextDroid("拖拽发送文件\n   (暂时无效)", 50, Colors.grey),
        ),
      ),
    );
  }
}
