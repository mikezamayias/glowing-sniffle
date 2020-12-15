import 'package:flutter/material.dart';
import 'package:hearts_card_game_sorta/constants.dart';

class Label extends StatelessWidget {
  const Label({
    Key key,
    @required this.flex,
    @required this.backgroundColor,
    @required this.text,
  }) : super(key: key);

  final int flex;
  final String backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          color: coolors[backgroundColor],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: coolors[backgroundColor].withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
