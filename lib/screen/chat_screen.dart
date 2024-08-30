import 'package:chat_app/screen/login_screen.dart';
import 'package:chat_app/widget/message_item.dart';
import 'package:chat_app/widget/stream_bilder_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const route = "ChatScreen";

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatSCreenState();
}

class _ChatSCreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User signedUser;

  String? message;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void openLoginScreen(){
    Navigator.of(context).pushNamed(LoginScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(
          children: [
            Image.asset(width: 30, height: 30, "assets/images/logo.png"),
            SizedBox(
              width: 10,
            ),
            Text("MessageMe",
                style: TextStyle(color: Colors.white, fontSize: 15))
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                openLoginScreen();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilderMessage(base: _fireStore.collection("messages").orderBy("time").snapshots(),signedUser: signedUser),
          Column(
            children: [
              Divider(
                height: 1,
                color: Colors.yellow[900],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter message here...",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        messageTextController.clear();
                        var sendMessage =
                            await _fireStore.collection("messages").add({
                          'text': message,
                          'sender': signedUser.email,
                          'time': FieldValue.serverTimestamp(),
                        });
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue[800],
                      ))
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
