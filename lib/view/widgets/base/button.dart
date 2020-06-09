// @author '彼时思默'
// @time 2019/10/30 12:09
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final title;
  final double width;
  final double height;
  final VoidCallback userOnPressed;

  Button(this.title, {this.width = 250, this.height = 44, this.userOnPressed});

  void defaultPressed() {
    print('$title');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: RaisedButton(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0xFF2AC875),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: userOnPressed??defaultPressed,
        ));
  }
}
