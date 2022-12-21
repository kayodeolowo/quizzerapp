// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

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
  final questions = const [
    {
      'questionText': 'what is your favourite color?',
      'answers': [
        {'text': 'yellow', 'score': 30},
        {'text': 'red', 'score': 20},
        {'text': 'green', 'score': 10},
        {'text': 'yellow', 'score': 1}
      ]
    },
    {
      'questionText': 'what is your favourite car?',
      'answers': [
        {'text': 'honda', 'score': 0},
        {'text': 'toyota', 'score': 10},
        {'text': 'bmw', 'score': 20},
        {'text': 'nissan', 'score': 40}
      ]
    },
    {
      'questionText': 'what is your favourite food?',
      'answers': [
        {'text': 'yellow', 'score': 30},
        {'text': 'tuwo', 'score': 0},
        {'text': 'rice', 'score': 10},
        {'text': 'maize', 'score': 20}
      ]
    }
  ];
  //
  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(" My Quiz"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
