import 'package:flutter/material.dart';
import 'package:hearts_card_game_sorta/constants.dart';

class BaseLabel extends StatelessWidget {
  const BaseLabel({
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
      child: Card(
        color: coolors[backgroundColor],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 20.0,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
