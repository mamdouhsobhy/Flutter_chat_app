import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  MessageItem({required this.sender, required this.message, required this.signedUser});

  final String sender;
  final String message;
  final User signedUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: signedUser.email == sender ? CrossAxisAlignment.end:CrossAxisAlignment.start ,
      children: [
        SizedBox(height: 18,),
        Text(sender,style: TextStyle(fontSize: 10,color: signedUser.email == sender ?Colors.yellow[900]: Colors.yellow[900]),),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(signedUser.email == sender ? 0:15),
            topLeft: Radius.circular(signedUser.email == sender ? 15:0),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ) ,
          color: signedUser.email == sender ? Colors.blue[800] : Colors.green,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text(message,style: TextStyle(color: Colors.white,fontSize: 15,)
          ),
         )
        )
    ],
    );
  }
}
