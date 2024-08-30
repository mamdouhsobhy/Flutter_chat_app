import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/widget/my_button.dart';
import 'package:chat_app/widget/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static const route = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  bool showSpinner = false;

  void openChatScreen() {
    Navigator.of(context).pushNamed(ChatScreen.route);
  }

  void checkSpinner(){
    setState(() {
      if(showSpinner) {
        showSpinner = false;
      } else {
        showSpinner = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(width: 100, height: 100, "assets/images/logo.png"),
                SizedBox(
                  height: 50,
                ),
                MyTextField(
                    hint: "Enter Your Email",
                    obscureText: false,
                    inputType: TextInputType.emailAddress,
                    takeValue: (value) {
                      email = value;
                    }),
                SizedBox(
                  height: 12,
                ),
                MyTextField(
                    hint: "Enter Your Password",
                    obscureText: true,
                    inputType: TextInputType.visiblePassword,
                    takeValue: (value) {
                      password = value;
                    }),
                SizedBox(
                  height: 30,
                ),
                MyButton(
                    color: Colors.yellow[900]!,
                    buttonText: "Sign In",
                    fun: () async {
                      checkSpinner();
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        openChatScreen();
                        checkSpinner();
                      } catch (e) {
                        print("Mamdouh $e");
                        checkSpinner();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
