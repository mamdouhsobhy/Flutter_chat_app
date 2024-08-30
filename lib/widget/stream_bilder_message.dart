import 'dart:async';

import 'package:chat_app/widget/message_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StreamBuilderMessage extends StatelessWidget {
  const StreamBuilderMessage({super.key, required this.base, required this.signedUser});

  final Stream<QuerySnapshot<Map<String, dynamic>>> base;
  final User signedUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: base,
        builder: (ctx, snapShot) {
          List<MessageItem> messageWidget = [];
          if (!snapShot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            );
          }

          final message = snapShot.data!.docs.reversed;
          for (var msg in message) {
            messageWidget.add(MessageItem(
                sender: msg.get('sender'), message: msg.get('text'),signedUser: signedUser,));
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.all(18),
              children: messageWidget,
            ),
          );
        });
  }
}
