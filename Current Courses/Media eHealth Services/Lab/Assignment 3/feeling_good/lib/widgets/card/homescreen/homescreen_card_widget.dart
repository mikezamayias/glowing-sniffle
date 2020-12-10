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
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.maybeOf(context).size.width,
            height: MediaQuery.maybeOf(context).size.height / 3.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  homescreenCardImages[text],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 13.0, 10.0, 10.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: colors["dark font"],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
