import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Container(
        child: Text(
          question,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
