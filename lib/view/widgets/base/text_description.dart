// @author '彼时思默'
// @time 2019/10/31 11:48
import 'package:flutter/material.dart';

class TextDescription extends StatefulWidget {
  final String text;
  TextDescription(this.text);
  @override
  _TextDescriptionState createState() => _TextDescriptionState(text);
}

class _TextDescriptionState extends State<TextDescription> {
  final String text;
  _TextDescriptionState(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF666666),
        fontSize: 16
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}