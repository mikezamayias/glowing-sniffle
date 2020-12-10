import 'package:flutter/material.dart';
import 'package:feeling_good/constants.dart';

class ArticleTextCard extends StatefulWidget {
  ArticleTextCard({Key key}) : super(key: key);

  @override
  _ArticleTextCardState createState() => _ArticleTextCardState();
}

class _ArticleTextCardState extends State<ArticleTextCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: ListTile(
        title: Text(
          'Article title?',
          style: TextStyle(
            color: colors["dark font"],
            fontSize: 30,
          ),
        ),
        subtitle: Text(
          'First sentence of article body blah blah blah.',
          style: TextStyle(
            color: colors["dark font"],
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
