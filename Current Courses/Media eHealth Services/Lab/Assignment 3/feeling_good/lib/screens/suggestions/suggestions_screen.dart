import 'package:feeling_good/main.dart';
import 'package:feeling_good/screens/home/home_screen.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => navigateTo('Home', context, ''),
        ),
        elevation: 20.0,
        backgroundColor: colors["dark purple"],
        title: Text(
          'Suggestions',
          style: TextStyle(
            fontFamily: 'Jura',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: colors["light font"],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              SuggestionCard(article: "article_1"),
              SuggestionCard(article: "article_2"),
              SuggestionCard(article: "article_3"),
              SuggestionCard(article: "article_4")
            ],
          ),
        ),
      ),
    );
  }
}
