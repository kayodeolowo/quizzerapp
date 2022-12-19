// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //
  var _questionIndex = 0;
  void answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'what is your favourite color?',
        'answers': ['black', 'red', 'green', 'yellow']
      },
      {
        'questionText': 'what is your favourite car?',
        'answers': [
          'honda',
          'toyota',
          'bmw',
        ]
      },
      {
        'questionText': 'what is your favourite food?',
        'answers': ['grape', 'rice', 'tuwo']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(" My Quiz"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
