import 'package:advanced_basics/quiz_answers_screen.dart';
import 'package:advanced_basics/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:advanced_basics/start_screen.dart';
import 'package:advanced_basics/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget activeScreen = const SizedBox();

  List<int> selectedAnswers = [];

  void chooseAnswer(int answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = QuizAnswersScreen(selectedAnswers,questions);
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuizScreen(chooseAnswer);
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 19, 47, 97),
                  Color.fromARGB(255, 40, 111, 233),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(child: activeScreen),
          ),
        ),
      ),
    );
  }
}
