import 'package:flutter/material.dart';

class HumanPanel extends StatefulWidget {
  const HumanPanel({Key key}) : super(key: key);

  @override
  _HumanPanelState createState() => _HumanPanelState();
}

class _HumanPanelState extends State<HumanPanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
