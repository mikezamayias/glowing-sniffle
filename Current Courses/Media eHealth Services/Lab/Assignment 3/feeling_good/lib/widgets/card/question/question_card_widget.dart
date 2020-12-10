import 'package:feeling_good/constants.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    Key key,
    @required this.questionIndexCounter,
  }) : super(key: key);

  final int questionIndexCounter;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
            color: colors["pale orange"],
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            )),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              questions[widget.questionIndexCounter],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
