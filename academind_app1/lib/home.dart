import 'package:flutter/material.dart';
import 'package:academind_app1/result_page.dart';
import 'package:academind_app1/questions_manager.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _quizIndex = 0;
  int _score = 0;

  void _goReset() {
    setState(() {
      _quizIndex = 0;
      _score = 0;
    });
  }

  void _goNextQuiz([int score = 0]) {
    _score += score;

    setState(() {
      _quizIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - Level 1'),
      ),
      body: Center(
        child: Container(
          child: (_quizIndex < QuestionsManager.questions.length)
              ? QuestionsManager(_goNextQuiz, _quizIndex)
              : ResultPage(_score, _goReset),
        ),
      ),
    );
  }
}
