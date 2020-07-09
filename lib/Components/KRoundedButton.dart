import 'package:flutter/material.dart';

class KRoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  KRoundedButton({this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
      color: color,
      elevation: 5,
      height: 50,
    );
  }
}
