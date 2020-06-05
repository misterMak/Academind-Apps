import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Map answer;
  final Function event;
  Answer(this.answer, this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 200, minHeight: 40),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            textColor: Colors.grey[50],
            color: Colors.blue[500],
            onPressed: () => event(answer['score']),
            child: Text(
              answer['text'],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
