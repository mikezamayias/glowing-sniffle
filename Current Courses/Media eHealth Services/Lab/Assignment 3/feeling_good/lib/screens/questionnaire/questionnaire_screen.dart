import 'package:feeling_good/constants.dart';
import 'package:feeling_good/main.dart';
import 'package:feeling_good/widgets/button/question/question_answer_buttons.dart';
import 'package:feeling_good/widgets/card/question/question_card_widget.dart';
import 'package:flutter/material.dart';

class QuestionnaireScreen extends StatefulWidget {
  QuestionnaireScreen({Key key}) : super(key: key);

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int questionIndexCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => navigateTo(context, 'Homescreen', ''),
        ),
        elevation: 20.0,
        backgroundColor: colors["dark purple"],
        title: Text(
          'Questionnaire',
          style: TextStyle(
            fontFamily: 'Jura',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: colors["light font"],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: colors["light font"],
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  staticQuestionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colors["dark font"],
                  ),
                ),
              ),
            ),
          ),
          QuestionCard(
            questionIndexCounter: questionIndexCounter,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (questionIndexCounter >= 8) {
                  questionIndexCounter = 0;
                  showDialog(
                    context: context,
                    // barrierColor: colors['pale orange'],
                    barrierDismissible: false,
                    builder: (_) => AlertDialog(
                      backgroundColor: colors['dark purple'],
                      actions: [
                        FlatButton(
                          onPressed: () =>
                              navigateTo(context, 'Homescreen', ''),
                          splashColor: colors['light font'],
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: colors['pale orange'],
                            ),
                          ),
                        ),
                      ],
                      content: Text(
                        'Return to home?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: colors['light font'],
                        ),
                      ),
                    ),
                  );
                  // navigateTo(context, 'Homescreen', '');
                } else {
                  questionIndexCounter++;
                }
              });
            },
            child: QuestionAnswerButtons(),
          ),
        ],
      ),
    );
  }
}
