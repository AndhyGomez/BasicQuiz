import 'package:basic_flutter_course_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// Leading underscore is declaring private accessor status
class _MyAppState extends State<MyApp> {
  // Map using key pair values
  final _questions = const [
    {
      'questionText': "What's my favorite color?",
      'AnswerChoices': [
        {'text': 'Purple', 'score': 50},
        {'text': 'Pink', 'score': 25},
        {'text': 'Blue', 'score': 10},
        {'text': 'Yellow', 'score': 0},
      ],
    },
    {
      'questionText': "What's my favorite animal?",
      'AnswerChoices': [
        {'text': 'Crow', 'score': 50},
        {'text': 'Tiger', 'score': 10},
        {'text': 'Wolf', 'score': 25},
        {'text': 'Shark', 'score': 0},
      ],
    },
    {
      'questionText': "What's my favorite food?",
      'AnswerChoices': [
        {'text': 'Pizza', 'score': 25},
        {'text': 'Pasta', 'score': 50},
        {'text': 'Meat', 'score': 10},
        {'text': 'Chowder', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answered(int score) {
    _totalScore += score;

    setState(() {
      /*
      Set state forces flutter to rerender the widget where set state was called
      */
      _questionIndex++;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[600],
          title: Text('App from scratch'),
        ),
        body: _questionIndex <
                _questions.length // ternary if else (conditional widgets)
            ? Quiz(
                answered: _answered,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz), // : signifies else
      ),
    );
  }
}
