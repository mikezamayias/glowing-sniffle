import 'package:final_project/views/profile/profile_element_view.dart';
import 'package:flutter/material.dart';

class ProfileTextView extends StatelessWidget {
  const ProfileTextView({
    Key key,
    @required this.text,
    @required this.data,
  }) : super(key: key);

  final String text;
  final String data;

  @override
  Widget build(BuildContext context) {
    return ProfileElementView(
      flex: 1,
      text: text,
      child: Text(
        data,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
