import 'package:flutter/material.dart';

import './question.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answered;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answered,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        // dynamically make answer widgets using an anonymous function
        ...(questions[questionIndex]['AnswerChoices']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answers(() => answered(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
