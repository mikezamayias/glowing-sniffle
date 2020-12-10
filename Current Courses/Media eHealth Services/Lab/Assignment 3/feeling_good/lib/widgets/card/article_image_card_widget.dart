import 'package:feeling_good/get_randoms.dart';
import 'package:flutter/material.dart';
import 'package:feeling_good/constants.dart';

class ArticleImageCard extends StatefulWidget {
  @override
  _ArticleImageCardState createState() => _ArticleImageCardState();
}

class _ArticleImageCardState extends State<ArticleImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.maybeOf(context).size.width,
      height: MediaQuery.maybeOf(context).size.height / 1.7,
      // height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(randomSplashscreenQuoteBackground),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    );
  }
}
