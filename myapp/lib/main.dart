import 'package:flutter/material.dart';

import './questions.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionindex = 0;

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What is your favourite animal?',
        'answers': ['Dog', 'Horse', 'Pidgeon', 'Kangaroo']
      },
      {
        'questionText': 'What is your favourite colour?',
        'answers': ['Red', 'Blue', 'Green', 'Pink'],
      },
      {
        'questionText': 'What is your favourite name?',
        'answers': ['Ieuan', 'Hugo', 'Nick', 'Sebastian'],
      }
    ];

    void _answerTheQuestion() {
      setState(() {
        _questionindex += 1;
      });
    }

    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionindex < questions.length
            ? Column(children: [
                Question(questions[_questionindex]['questionText']),
                ...(questions[_questionindex]['answers'] as List<String>)
                    .map((answer) {
                  return Answer(_answerTheQuestion, answer);
                }).toList()
              ])
            : Center(
                child: Text(
                'You did it!',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 64,
                    fontWeight: FontWeight.bold),
              )),
      ),
    );
  }
}
