/*
@author '彼时思默'
@time 20-12-10 上午10:49
@describe: 
*/
import 'package:hive/hive.dart';

Box box;
Future<void> boxInit() async {
  Hive.init("config.yaml");
  box= await Hive.openBox('default');
}
Box getBox(){
  assert(box!=null);
  return box;
}