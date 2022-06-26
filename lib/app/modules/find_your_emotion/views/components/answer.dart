import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Answer(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Your emotion is ' + text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24.0,
      ),
    );
  }
}
