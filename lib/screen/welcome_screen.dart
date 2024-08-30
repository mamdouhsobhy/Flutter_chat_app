import 'package:chat_app/screen/login_screen.dart';
import 'package:chat_app/screen/registration_screen.dart';
import 'package:chat_app/widget/my_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  void openAuthScreen(String route){
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Image.asset(width: 100,height: 100,"assets/images/logo.png"),
                  Text("MessageMe",style: TextStyle(
                    fontSize: 40,color: Colors.indigo[900],fontWeight: FontWeight.w900),
                  )
                ],
              ),
              SizedBox(height: 30,),
              MyButton(color: Colors.yellow[900]!, buttonText: "Sign In", fun: (){
                openAuthScreen(LoginScreen.route);
              }),
              MyButton(color: Colors.blue[800]!, buttonText: "Register", fun: (){
                openAuthScreen(RegistrationScreen.route);
              }),
            ],
          ),
        ),
      ),
    );
  }
}


