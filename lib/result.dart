// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 50) {
      resultText = 'you try';
    } else if (resultScore <= 70) {
      resultText = ' good boy';
    } else {
      resultText = 'you bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          ElevatedButton(
            onPressed: resetHandler,
            child: Text("Restart Quiz"),
          )
        ],
      ),
    );
  }
}
