import 'package:advanced_basics/models/quiz_questions.dart';
import 'package:flutter/material.dart';

class QuizAnswersScreen extends StatelessWidget {
  QuizAnswersScreen(this.selectedAnswers, this.questions, {super.key});

  final List<int> selectedAnswers;
  final List<QuizQuestions> questions;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summery.add({
        "QuestionIndex": i,
        "Question": questions[i].question,
        "CorrectAnswer":
        questions[i].options[questions[i].correctAnswerIndex],
        "UserAnswer": questions[i].options[selectedAnswers[i]],
        "IsCorrect":
        questions[i].correctAnswerIndex == selectedAnswers[i],
      });
    }

    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummeryData();

    final correctAnswersCount = summeryData.where((data) {
      return data["IsCorrect"] as bool;
    }).length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              "You answered $correctAnswersCount out of ${questions.length} questions correctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 0),

            Expanded(
              child: ListView.builder(
                itemCount: summeryData.length,
                itemBuilder: (context, index) {
                  final data = summeryData[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Q${index + 1}: ${data["Question"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Your Answer: ${data["UserAnswer"]}",
                          ),

                          Text(
                            "Correct Answer: ${data["CorrectAnswer"]}",
                          ),

                          const SizedBox(height: 8),

                          Text(
                            (data["IsCorrect"] as bool)
                                ? "✅ Correct"
                                : "❌ Wrong",
                            style: TextStyle(
                              color: (data["IsCorrect"] as bool)
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}