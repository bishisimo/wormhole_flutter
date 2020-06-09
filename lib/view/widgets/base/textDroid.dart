/*
@author '彼时思默'
@time 20-5-18 下午2:28
@describe: 
*/
import 'package:flutter/material.dart';

class TextDroid extends StatelessWidget {
  final String title;
  final double size;
  final Color color;

  TextDroid(this.title, [this.size,this.color]);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontFamily: "Droid", fontSize: size,color: this.color),
    );
  }
}
