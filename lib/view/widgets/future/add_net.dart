/*
@author '彼时思默'
@time 20-5-30 下午12:00
@describe: 
*/
import 'package:flutter/material.dart';
import 'package:wormhole/utils/local_ip.dart';

class AddNetTextField extends StatefulWidget {
  @override
  _AddNetTextFieldState createState() => _AddNetTextFieldState();
}

class _AddNetTextFieldState extends State<AddNetTextField> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLocalIp(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return TextField(
              decoration: InputDecoration(
                fillColor: Colors.blue.shade100,
                filled: true,
                hintText: snapshot.data,
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }
          return Container(
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.blue.shade100,
                filled: true,
                hintText: "255.255.255.255",
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        });
  }
}
