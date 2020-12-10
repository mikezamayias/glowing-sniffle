import 'package:flutter/material.dart';
import 'package:feeling_good/constants.dart';

class ArticleImageCard extends StatelessWidget {
  const ArticleImageCard({
    Key key,
    @required this.article,
  }) : super(key: key);

  final String article;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.maybeOf(context).size.width,
      height: MediaQuery.maybeOf(context).size.height / 1.8,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(articleImages['$article']),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    );
  }
}
