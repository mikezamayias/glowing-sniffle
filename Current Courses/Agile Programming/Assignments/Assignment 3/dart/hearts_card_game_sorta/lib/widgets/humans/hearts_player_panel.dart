import 'package:flutter/material.dart';
import 'package:hearts_card_game_sorta/constants.dart';
import 'package:hearts_card_game_sorta/widgets/buttons/human_panel_button.dart';

class HeartsPlayerPanel extends StatelessWidget {
  const HeartsPlayerPanel({
    Key key,
    @required this.color,
    @required this.memberKind,
  }) : super(key: key);

  final String color;
  final String memberKind;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coolors[color],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: coolors[color].withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: coolors[color],
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  memberKind,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              // padding: EdgeInsets.all(20.0),
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HumanPanelButton(
                    color: "turquoise",
                    text: "data",
                  ),
                  HumanPanelButton(
                    color: "maya blue",
                    text: "data",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
