import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feeling_good/constants.dart';
import 'package:feeling_good/screens/splash/splash_screen.dart';
import 'package:feeling_good/screens/home/home_screen.dart';
import 'package:feeling_good/screens/suggestions/suggestions_screen.dart';
import 'package:feeling_good/screens/questionnaire/questionnaire_screen.dart';

void main() {
  runApp(FeelingGoodApp());
}

class FeelingGoodApp extends StatefulWidget {
  @override
  _FeelingGoodAppState createState() => _FeelingGoodAppState();
}

class _FeelingGoodAppState extends State<FeelingGoodApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Jura'),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: colors["dark purple"], // status bar color
            systemNavigationBarColor:
                colors["dark purple"], // navigation bar color
            statusBarIconBrightness:
                Brightness.light, // status bar icons' color
            systemNavigationBarIconBrightness:
                Brightness.light //navigation bar icons' color
            ),
        child: SplashScreen(),
      ),
    );
  }
}

void navigateTo(String screen, BuildContext context) {
  var duration = Duration(seconds: 1);
  Future.delayed(
    duration,
    () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          if (screen == 'Suggestions') {
            return SuggestionsScreen();
          } else if (screen == 'Questionnaire') {
            return QuestionnaireScreen();
          } else {
            return HomeScreen();
          }
        }),
        (route) => false,
      );
    },
  );
}
