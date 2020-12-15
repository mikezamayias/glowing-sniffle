import 'package:flutter/material.dart';

class HeartsDealerPanel extends StatelessWidget {
  const HeartsDealerPanel({
    Key key,
    @required this.memberKind,
  }) : super(key: key);

  final String memberKind;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  memberKind,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('data'),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Text('data'),
                ),
                Container(
                  color: Colors.blue,
                  child: Text('data'),
                ),
                Container(
                  color: Colors.yellow,
                  child: Text('data'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
