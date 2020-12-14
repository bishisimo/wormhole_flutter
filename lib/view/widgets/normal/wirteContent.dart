/*
@author '彼时思默'
@time 20-5-21 下午1:07
@describe: 
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wormhole/server/redux.dart';
import 'package:wormhole/view/widgets/base/textDroid.dart';

class WritContent extends StatefulWidget {
  @override
  _WritContentState createState() => _WritContentState();
}

class _WritContentState extends State<WritContent> {
  var inputMessage="";
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xFFD8D8D8),
          ),
          left: BorderSide(
            width: 1,
            color: Color(0xFFD8D8D8),
          ),
        )),
        child: Stack(

          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: TextField(
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  fillColor: Colors.blue.shade100,
                  filled: true,
                  prefixIcon: IconButton(
                    icon: Icon(Icons.input),
                    onPressed: ()=>{},
                  ),
                  labelText: "Edit Here",
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:BorderSide(width: 0)
                  ),
                ),
                onChanged: (context)=>{
                inputMessage=context
                },
              ),
            ),

           Positioned(
             bottom:10,
             right: 20,
             child:  Container(
               height: 32,
               child: RaisedButton(
                 child: TextDroid("发送"),
                 onPressed: () => {
                   if (inputMessage.startsWith("f:")&&!inputMessage.contains("\n")){
                     // Redux().sendFileByPath(inputMessage.substring(2))
                   }else{
                     // Redux().sendString(inputMessage)
                   }
                 },
               ),
             ),
           )
          ],
        ));
  }
}
