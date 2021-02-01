import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int quizScore;
  final Function reset;

  Result(this.quizScore, this.reset);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Score: ' + quizScore.toString(),
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            color: Colors.purple[600],
            textColor: Colors.white,
            child: Text("Restart Quiz?"),
            onPressed: reset,
          ),
        ],
      ),
    );
  }
}
