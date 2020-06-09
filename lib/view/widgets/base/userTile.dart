/*
@author '彼时思默'
@time 20-5-23 下午3:15
@describe: 
*/
import 'package:flutter/material.dart';
import 'package:wormhole/core/server/redux.dart';

class UserTile extends StatefulWidget {
  @override
  _UserTileState createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  var isReadOnly=true;
  changeReadOnly(){
    setState(() {
      isReadOnly=!isReadOnly;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.greenAccent),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.image,
            color: Colors.grey,
          ),
        ),
        title: TextField(
          readOnly: isReadOnly,
          decoration: InputDecoration(
            fillColor: Colors.blue.shade100,
            filled: true,
            prefixIcon: IconButton(
              icon: Icon(Icons.cloud_done),
              onPressed: changeReadOnly,
              color: isReadOnly?Colors.grey:Colors.blue,
            ),
            labelText: "user",
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onSubmitted: (str)=>{
            changeReadOnly(),
            setState(() {
              Redux().myName = str;
              Redux().broadcast("rename");
            })
          },
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.refresh,
          ),
          onPressed: changeReadOnly,
        ),
      ),
    );
  }
}
