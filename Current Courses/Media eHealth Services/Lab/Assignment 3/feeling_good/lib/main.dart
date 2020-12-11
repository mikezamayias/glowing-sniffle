import 'package:feeling_good/constants.dart';
import 'package:feeling_good/screens/article_screen.dart';
import 'package:feeling_good/screens/home_screen.dart';
import 'package:feeling_good/screens/questionnaire_screen.dart';
import 'package:feeling_good/screens/splash_screen.dart';
import 'package:feeling_good/screens/suggestions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: colors["dark purple"],
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light),
        child: SplashScreen(),
      ),
    );
  }
}

void navigateTo(BuildContext context, String screen, String article) {
  Duration duration = Duration(milliseconds: 100);
  Future.delayed(
    duration,
    () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            if (screen == 'Suggestions') {
              return SuggestionsScreen();
            } else if (screen == 'Questionnaire') {
              return QuestionnaireScreen();
            } else if (screen == 'Article') {
              return ArticleScreen(article: '$article');
            } else {
              return HomeScreen();
            }
          },
        ),
        (route) => false,
      );
    },
  );
}

int navigateQuestions(BuildContext context, int counter) {
  Duration duration = Duration(milliseconds: 100);
  Future.delayed(
    duration,
    () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return;
          },
        ),
        (route) => false,
      );
    },
  );
  return counter++;
}
