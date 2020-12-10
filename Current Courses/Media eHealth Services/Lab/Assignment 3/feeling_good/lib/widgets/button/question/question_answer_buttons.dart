import 'package:feeling_good/widgets/button/answer/answer_button.dart';
import 'package:flutter/material.dart';

class QuestionAnswerButtons extends StatelessWidget {
  const QuestionAnswerButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AnswerButton(
            answer: 'Not at all',
          ),
          AnswerButton(
            answer: 'Several days',
          ),
          AnswerButton(
            answer: 'More than half the days',
          ),
          AnswerButton(
            answer: 'Nearly every day',
          ),
        ],
      ),
    );
  }
}
