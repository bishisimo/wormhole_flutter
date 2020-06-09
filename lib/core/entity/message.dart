/*
@author '彼时思默'
@time 20-5-30 下午8:11
@describe: 
*/
class TcpMessage {
  String type; //传输类型
  int index; //分片索引
  String sendPath; //发送文件的路径
  String status; //状态
  List<int> content; //数据内容
  int contentLen; //校验值
  String extraStr1; //补充字段
  int extraInt1; //补充字段
  TcpMessage(this.type, this.index, this.sendPath, this.status, this.content,
      [this.extraStr1, this.extraInt1]) {
    if (content != null) {
      contentLen = content.length;
    } else {
      contentLen = 0;
      content = List();
    }
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'index': index,
    'sendPath': sendPath,
    'status': status,
    'content': content,
    'contextLen': contentLen,
    'extraStr1': extraStr1,
    'extraInt1': extraInt1,
  };

  TcpMessage.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    index = json['index'];
    sendPath = json['sendPath'];
    status = json['status'];
    var originContent = json['content'];
    content = List<int>.from(originContent);
    contentLen = json['contextLen'];
    extraStr1 = json['extraStr1'];
    extraInt1 = json['extraInt1'];
  }
}

class UdpMsg{
  String event;
  String name;
  UdpMsg(this.event,[this.name]);
  Map<String, dynamic> toJson() => {
    'event': event,
    'name': name,
  };
  UdpMsg.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    name = json['name'];
  }
}
