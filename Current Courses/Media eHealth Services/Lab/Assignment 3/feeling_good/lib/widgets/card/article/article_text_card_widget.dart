import 'package:flutter/material.dart';
import 'package:feeling_good/constants.dart';

class ArticleTextCard extends StatelessWidget {
  const ArticleTextCard({
    Key key,
    @required this.article,
  }) : super(key: key);

  final String article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: ListTile(
        title: Text(
          articleTitles['$article'],
          style: TextStyle(
            color: colors["dark font"],
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
          child: Text(
            articleDescriptions['$article'],
            style: TextStyle(
              color: colors["dark font"],
              fontSize: 20,
            ),
          ),
        ),
        isThreeLine: true,
        dense: true,
        enableFeedback: true,
      ),
    );
  }
}
