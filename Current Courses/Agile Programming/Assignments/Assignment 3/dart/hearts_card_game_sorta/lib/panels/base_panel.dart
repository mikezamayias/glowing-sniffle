import 'package:flutter/material.dart';
import 'package:hearts_card_game_sorta/constants.dart';

class BasePanel extends StatelessWidget {
  const BasePanel({
    Key key,
    @required this.flex,
    @required this.backgroundColor,
    @required this.child,
  }) : super(key: key);

  final int flex;
  final String backgroundColor;
  final Widget child;

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
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: child,
        ),
      ),
    );
  }
}
