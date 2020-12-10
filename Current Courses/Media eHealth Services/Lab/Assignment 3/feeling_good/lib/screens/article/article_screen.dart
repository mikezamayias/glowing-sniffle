import 'package:feeling_good/constants.dart';
import 'package:feeling_good/main.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({
    Key key,
    @required this.article,
  }) : super(key: key);

  final String article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => navigateTo(context, 'Suggestions', ''),
        ),
        elevation: 20.0,
        backgroundColor: colors["dark purple"],
        title: Text(
          articleTitles['$article'],
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
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Text(
              articleBodies["$article"],
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
