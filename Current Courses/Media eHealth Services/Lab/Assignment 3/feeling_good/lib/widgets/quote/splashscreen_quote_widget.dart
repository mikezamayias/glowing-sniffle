import 'package:flutter/material.dart';
import 'package:feeling_good/constants.dart';

class SplashscreenCard extends StatelessWidget {
  const SplashscreenCard({
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
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 20,
      color: backgroundcolor,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
