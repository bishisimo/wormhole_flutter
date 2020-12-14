/*
@author '彼时思默'
@time 20-12-10 上午10:58
@describe: 
*/
import 'package:mobx/mobx.dart';
part 'capture.g.dart';
class Capture = CaptureMobx with _$Capture;
abstract class CaptureMobx with Store {
  /// 可观察的值
  @observable String selfName = "";//set
  @observable String selfHost = "127.0.0.1";
  @observable String selfPort = "1080";
  @observable String udpPort = "18080";
  @observable String targetHost = "";//set
  @observable String message = "";//set

  /// 设置值
  @action void setSelfName(String value) {
    this.selfName = value;
  }
  @action void setTargetHost(String value) {
    this.targetHost = value;
  }
  @action void setMessage(String value) {
    this.message = value;
  }
  // @action void setSelfName(String value) {
  //   this.selfName = value;
  // }
}