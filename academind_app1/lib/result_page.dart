import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final Function goReset;
  ResultPage(this.score, this.goReset);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "\nYOUR SCORE: $score",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        FlatButton.icon(
          onPressed: goReset,
          textColor: Colors.blue,
          icon: Icon(Icons.settings_backup_restore, size: 30),
          label: Text('RESET QUIZ', style: TextStyle(fontSize: 30)),
        ),
      ],
    );
  }
}
