import 'package:flutter/material.dart';
import 'package:wormhole/view/overview.dart';

import 'core/server/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Wormhole',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Overview(),
    );
  }
//  initRedux(){
//    var redux=Redux();
//    redux.
//  }
}