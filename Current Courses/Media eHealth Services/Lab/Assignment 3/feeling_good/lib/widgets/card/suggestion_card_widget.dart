import 'package:flutter/material.dart';
import 'package:feeling_good/constants.dart';
import 'article_image_card_widget.dart';
import 'article_text_card_widget.dart';

class SuggestionCard extends StatefulWidget {
  SuggestionCard({Key key}) : super(key: key);

  @override
  _SuggestionCardState createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.maybeOf(context).size.width / 1.3,
        height: MediaQuery.maybeOf(context).size.height,
        decoration: BoxDecoration(
          color: colors["pale orange"],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ArticleImageCard(),
            ArticleTextCard(),
          ],
        ),
      ),
    );
  }
}
