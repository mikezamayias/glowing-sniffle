import 'package:feeling_good/widgets/card/suggestion_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:feeling_good/constants.dart';


class SuggestionsScreen extends StatefulWidget {
  @override
  _SuggestionsScreenState createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: colors["dark purple"],
        title: Text(
          'Suggestions',
          style: TextStyle(
            fontFamily: 'Jura',
            fontWeight: FontWeight.bold,
            color: colors["light font"]
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              SuggestionCard(),
              SuggestionCard(),
              SuggestionCard()
            ],
          ),
        ),
      ),
    );
  }
}
