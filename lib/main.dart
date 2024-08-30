import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/screen/login_screen.dart';
import 'package:chat_app/screen/registration_screen.dart';
import 'package:chat_app/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    final _auth = FirebaseAuth.instance;

    return MaterialApp(
      title: 'Message app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white), // This might override actionsIconTheme
          )
      ),
      initialRoute: _auth.currentUser!=null ? ChatScreen.route : '/'  ,
      routes: {
        '/': (ctx) => WelcomeScreen(),
        LoginScreen.route: (ctx) => LoginScreen(),
        RegistrationScreen.route: (ctx) => RegistrationScreen(),
        ChatScreen.route: (ctx) => ChatScreen(),
      },
    );
  }
}
