import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  bool _answered = false;

  void _answerQuestion() {
    setState(() {
      _answered = true;
    });
  }

  void _nextQuestion() {
    setState(() {
      _answered = false;
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // Close action
          },
        ),
        title: LinearProgressIndicator(
          value: (_questionIndex + 1) / 10,
          backgroundColor: Colors.grey[300],
          color: Colors.green,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Question ${_questionIndex + 1} of 10 - Fundamentals",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Situation: Oil prices fall and are forecasted to stay low.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Question: What will happen with the British Pound / Norwegian krone?",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Expanded(
              child: _answered
                  ? Image.asset('assets/correct.png') // Change to correct image after answer
                  : Image.asset('assets/question.png'),
            ),
            SizedBox(height: 16),
            if (!_answered)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _answerQuestion,
                    child: Text('Up'),
                  ),
                  ElevatedButton(
                    onPressed: _answerQuestion,
                    child: Text('Down'),
                  ),
                ],
              ),
            if (_answered)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    child: Text('Continue'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Show explanation
                    },
                    child: Text('Explanation'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
