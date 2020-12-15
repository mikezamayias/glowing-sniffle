import 'package:flutter/material.dart';
import 'package:hearts_card_game_sorta/constants.dart';
import 'package:hearts_card_game_sorta/widgets/human_label.dart';
import 'package:hearts_card_game_sorta/widgets/button_label.dart';

class HeartsDealerPanel extends StatelessWidget {
  const HeartsDealerPanel({
    Key key,
    @required this.flex,
    this.backgroundColor,
    this.memberKind,
  }) : super(key: key);

  final int flex;
  final String backgroundColor;
  final String memberKind;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HumanLabel(
                flex: 2,
                text: "Dealer",
              ),
              SizedBox(
                height: 20,
              ),
              ButtonLabel(
                flex: 1,
                text: "Introduce",
              ),
              SizedBox(
                height: 20,
              ),
              ButtonLabel(
                flex: 1,
                text: "Show deck",
              ),
              SizedBox(
                height: 20,
              ),
              ButtonLabel(
                flex: 1,
                text: "Deal",
              ),
              SizedBox(
                height: 20,
              ),
              ButtonLabel(
                flex: 1,
                text: "Decide winner",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
