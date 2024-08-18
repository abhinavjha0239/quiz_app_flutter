import 'package:flutter/material.dart';
import '../models/question.dart'; // Import the Question model

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function(String) onAnswerSelected;
  final String selectedAnswer;

  QuestionWidget({
    required this.question,
    required this.onAnswerSelected,
    required this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Situation: ${question.situation}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Question: ${question.question}',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Image.asset(
            question.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            onAnswerSelected('Up');
          },
          child: Text('Up'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            textStyle: TextStyle(fontSize: 18),
            backgroundColor: selectedAnswer == 'Up' ? Colors.purple : null,
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            onAnswerSelected('Down');
          },
          child: Text('Down'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            textStyle: TextStyle(fontSize: 18),
            backgroundColor: selectedAnswer == 'Down' ? Colors.purple : null,
          ),
        ),
      ],
    );
  }
}
