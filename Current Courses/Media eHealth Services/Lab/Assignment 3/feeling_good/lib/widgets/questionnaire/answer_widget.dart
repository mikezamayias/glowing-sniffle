import 'package:feeling_good/constants.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    Key key,
    @required this.answer,
  }) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: colors["dark purple"],
            borderRadius: BorderRadius.all(
              Radius.circular(100.0),
            )),
        child: Align(
          child: Text(
            answer,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: colors["light font"],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
