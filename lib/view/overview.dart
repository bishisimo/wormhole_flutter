/*
@author '彼时思默'
@time 20-5-18 上午10:20
@describe: 
*/
import 'package:flutter/material.dart';
import 'package:wormhole/view/page/home.dart';
class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:HomePage()
        ),
    );
  }
}
