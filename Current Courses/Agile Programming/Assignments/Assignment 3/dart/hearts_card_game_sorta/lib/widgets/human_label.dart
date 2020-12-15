import 'package:flutter/material.dart';
import 'package:hearts_card_game_sorta/widgets/base_label.dart';

class HumanLabel extends StatelessWidget {
  const HumanLabel({
    Key key,
    @required this.flex,
    @required this.text,
  }) : super(key: key);

  final int flex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BaseLabel(
      flex: flex,
      backgroundColor: "white",
      text: text,
    );
  }
}
