import 'dart:math';
import 'constants.dart';

String randomSplashscreenQuote =
    splashscreenQuotes[Random().nextInt(splashscreenQuotes.length)];
String splashscreenBackground = "assets/images/lowpoly_house.jpg";
Map<String, String> articleImages = {
  'article_1': 'assets/images/mountain_shore.jpg',
  'article_2': 'assets/images/mountain.jpg',
  'article_3': 'assets/images/mountains.jpg',
  'article_4': 'assets/images/splash_forest.jpg'
};
