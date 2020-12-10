import 'package:flutter/material.dart';
import 'package:feeling_good/constants.dart';

class HomescreenCard extends StatelessWidget {
  const HomescreenCard({
    Key key,
    this.context,
    @required this.text,
    @required this.backgroundcolor,
  }) : super(key: key);

  final BuildContext context;
  final String text;
  final Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: MediaQuery.maybeOf(context).size.height / 2.5,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: colors["dark font"],
            ),
          ),
        ),
      ),
    );
  }
}
