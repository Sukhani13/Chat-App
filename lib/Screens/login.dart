import 'package:Chat_App/Components/KRoundedButton.dart';
import 'package:Chat_App/Screens/chat.dart';
import 'package:Chat_App/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Icon(
                    Icons.flash_on,
                    size: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _email,
                decoration: kTextFieldDecoration,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _password,
                decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Enter your password'),
                obscureText: true,
              ),
              SizedBox(
                height: 25,
              ),
              KRoundedButton(
                text: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  print(_email.text);
                  print(_password.text);
                  //_password.clear();
                  try {
                    setState(() {
                      showSpinner = true;
                    });
                    final user = await _auth.signInWithEmailAndPassword(
                      email: _email.text.trim(),
                      password: _password.text.trim(),
                    );
                    if (user != null) {
                      Navigator.pushNamed(context, Chat.id);
                    }
                    _password.clear();
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
