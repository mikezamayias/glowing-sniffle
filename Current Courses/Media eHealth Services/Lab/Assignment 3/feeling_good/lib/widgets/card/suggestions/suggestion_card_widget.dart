import 'package:feeling_good/main.dart';
import 'package:flutter/material.dart';
import 'package:feeling_good/constants.dart';
import '../article/article_image_card_widget.dart';
import '../article/article_text_card_widget.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({
    Key key,
    @required this.article,
  }) : super(key: key);

  final String article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.maybeOf(context).size.width / 1.3,
        height: MediaQuery.maybeOf(context).size.height,
        decoration: BoxDecoration(
          color: colors["pale orange"],
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: GestureDetector(
          onTap: () => navigateTo(context, 'Article', '$article'),
          // onTap: () => showDialog(
          //   context: context,
          //   barrierDismissible: true,
          //   builder: (_) => AlertDialog(
          //     content: SingleChildScrollView(
          //       child: Text(articleTitle),
          //     ),
          //   ),
          // ),
          child: Column(
            children: <Widget>[
              ArticleImageCard(article: '$article'),
              ArticleTextCard(article: '$article')
            ],
          ),
        ),
      ),
    );
  }
}
