import 'package:flutter/material.dart';
import 'package:academind_app1/answer.dart';
import 'package:academind_app1/question.dart';

class QuestionsManager extends StatelessWidget {
  final Function goNextQuiz;
  final int index;
  final Map quiz;

  static final List<Question> questions = [
    Question('What is your name?'),
    Question('What is your surname?'),
    Question('What is your age?'),
    Question('What is your Number?'),
  ];

  static final List<List<Map<Object, Object>>> answers = [
    [
      {'text': 'Mirkamol', 'score': 3},
      {'text': 'Amirkhon', 'score': 2},
      {'text': 'Kamola', 'score': 5},
      {'text': 'Sevara', 'score': 4},
    ],
    [
      {'text': 'Khamidov', 'score': 3},
      {'text': 'Yusupov', 'score': 2},
      {'text': 'Khamidova', 'score': 5},
    ],
    [
      {'text': '18-', 'score': 3},
      {'text': '18+', 'score': 2},
    ],
    [
      {'text': '11231241', 'score': 3},
      {'text': '23423423', 'score': 2},
      {'text': '43434433', 'score': 5},
      {'text': '13123122', 'score': 4},
    ],
  ];

  static List<Answer> fetchAnswers(List<Map<Object, Object>> answers,
      {@required onTap}) {
    return answers.map((answer) => Answer(answer, onTap)).toList();
  }

  //===

  QuestionsManager._(this.goNextQuiz, this.index, this.quiz);

  factory QuestionsManager(goNext, index) {
    var quiz = {
      "question": questions[index],
      "answers": fetchAnswers(answers[index], onTap: goNext)
    };
    return QuestionsManager._(goNext, index, quiz);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          quiz['question'],
          ...quiz['answers'],
        ],
      ),
    );
  }
}
