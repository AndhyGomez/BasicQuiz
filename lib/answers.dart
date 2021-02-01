import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Function checkIfAnswered;
  final String answerText;

  Answers(this.checkIfAnswered, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.purple[600],
        textColor: Colors.white,
        child: Text(answerText),
        onPressed:
            checkIfAnswered, // passes a pointer to function by not using parentheses
      ),
    );
  }
}
