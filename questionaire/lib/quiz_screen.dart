import 'dart:ffi';

import 'package:advanced_basics/models/quiz_questions.dart';
import 'package:flutter/material.dart';
import 'package:advanced_basics/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(this.chooseAnswer,{super.key});

  final void Function(int answer) chooseAnswer;

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}


class _QuizScreenState extends State<QuizScreen> {
  QuizQuestions currentQuestion = questions[0];

  int counter = 0;

  void goNextQuestion() {
    setState(() {
      if(questions.length-1 <= counter){
        print("Quiz Completed");
      }else{
        counter++;
      }
      currentQuestion = questions[counter];
    });
  }

  void _chosenOption(index) {
    print("Option Chosen: $index");
    widget.chooseAnswer(index);
    goNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              textAlign: TextAlign.center,
              currentQuestion.question,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            ...currentQuestion.options.asMap().entries.map((option) {
              final index = option.key;
              final value = option.value;
              return ElevatedButton(
                onPressed: () => _chosenOption(index),
                child: Text(value),
              );
            }),
          ],
        ),
      ),
    );
  }
}
