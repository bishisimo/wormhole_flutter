import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:path/path.dart' as path;
import 'package:hive/hive.dart';
import 'package:process_run/shell.dart';
import 'package:wormhole/utils/box.dart';
import 'package:wormhole/utils/local_ip.dart';
import 'package:wormhole/view/overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future<void> initConfig() async {
    boxInit();
    box.put("udp_port", 10808);
    box.put("self_port", 1808);
    box.put("self_host", await getLocalIp());
    var baseDir="";
    box.put("accept_dir", path.join(baseDir, "accept"));
    box.put("self_name", "undefined");
    box.put("ip_mode", "auto");
    box.put("log_lever", "info");
    var directory = new Directory(box.get("accept_dir"));
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    var shell = Shell();

    await shell.run("wormhole server");

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wormhole',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Overview(),
    );
  }
}
