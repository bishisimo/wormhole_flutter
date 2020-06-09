// @author '彼时思默'
// @time 2019/10/31 16:43
import 'dart:ui';

import 'package:flutter/material.dart';

class TitleTiTle extends StatelessWidget {
  final String title;
  final onTab;
  final color;

  TitleTiTle(this.title, this.onTab, [this.color]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTab,
        child: Container(
            height: 50,
            decoration:
                BoxDecoration(color: color != null ? color : Color(0xFFD8D8D8)),
//        child: GestureDetector(
//            onTap: onTab,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(fontFamily: "Droid"),
              ),
            )));
  }
}
