import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scoreCounter = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
  ];

  List<String> questions = [
    'You can lead a cow downstairs but not upstairs',
    'Approximately one quater of  human bones are in their feet',
    'A slug\'s blood is green'
  ];

  List<bool> ans = [false, true, true];
  int questionNumber = 0;

  void check(bool value) {
    if (ans[questionNumber] == value) {
      scoreCounter.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreCounter.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    questions[questionNumber],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (questionNumber < 2) {
                            check(true);
                            questionNumber++;
                          } else {
                            check(true);
                            questionNumber = 0;
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (questionNumber < 2) {
                            check(false);
                            questionNumber++;
                          } else {
                            check(false);
                            questionNumber = 0;
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: scoreCounter,
              )
            ],
          ),
        ),
      ),
    );
  }
}
