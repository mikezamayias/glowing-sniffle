import 'package:flutter/material.dart';
import 'package:feeling_good/get_randoms.dart';
import 'package:feeling_good/widgets/quote/splashscreen_quote_widget.dart';
import 'package:feeling_good/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var duration = Duration(seconds: 5);
    Future.delayed(
      duration,
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }),
          (route) => false,
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(randomSplashscreenQuoteBackground),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              child: SplashscreenCard(
                text: randomSplashscreenQuote,
                backgroundcolor: Color(0X882E2334),
              ),
              padding: EdgeInsets.all(40.0),
            ),
          ),
        ),
      ),
    );
  }
}
