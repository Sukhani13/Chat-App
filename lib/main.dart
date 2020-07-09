import 'package:Chat_App/Screens/chat.dart';
import 'package:Chat_App/Screens/login.dart';
import 'package:Chat_App/Screens/register.dart';
import 'package:Chat_App/Screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (_) => Welcome(),
        Register.id: (_) => Register(),
        Login.id: (_) => Login(),
        Chat.id: (_) => Chat(),
      },
    );
  }
}
