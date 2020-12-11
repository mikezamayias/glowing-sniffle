import 'package:feeling_good/constants.dart';
import 'package:feeling_good/main.dart';
import 'package:feeling_good/widgets/homescreen/homescreen_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget homescreenCard(screen) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, screen, '');
      },
      child: HomescreenCard(
        text: screen,
        backgroundcolor: colors["pale orange"],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leadingWidth: 0.0,
        // backgroundColor: Colors.amber[900],
        backgroundColor: colors["dark purple"],
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Depression CBT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colors["light font"],
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              homescreenCard('Suggestions'),
              homescreenCard('Questionnaire'),
            ],
          ),
        ),
      ),
    );
  }
}
