import 'package:flutter/material.dart';
import 'package:academind_app1/home.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Quizzes',
      home: Home(),
    );
  }
}
