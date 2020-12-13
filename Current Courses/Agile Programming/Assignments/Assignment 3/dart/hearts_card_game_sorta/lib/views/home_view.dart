import 'package:flutter/material.dart';
import 'package:hearts_card_game_sorta/widgets/human_panel.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: HumanPanel(),
              ),
              Expanded(
                flex: 2,
                child: HumanPanel(),
              ),
              Expanded(
                flex: 1,
                child: HumanPanel(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
