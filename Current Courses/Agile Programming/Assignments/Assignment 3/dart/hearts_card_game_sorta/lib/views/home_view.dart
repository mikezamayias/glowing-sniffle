import 'package:flutter/material.dart';
import 'package:hearts_card_game_sorta/widgets/human/hearts_dealer_panel.dart';
import 'package:hearts_card_game_sorta/widgets/human/hearts_player_panel.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: HeartsDealerPanel(
                  color: "quick silver",
                  memberKind: 'Dealer',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: HeartsPlayerPanel(
                  color: "quick silver",
                  memberKind: 'Player 1',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: HeartsPlayerPanel(
                  color: "quick silver",
                  memberKind: 'Player 2',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
