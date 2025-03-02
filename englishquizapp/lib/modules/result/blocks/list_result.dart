// list_result.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:englishquizapp/modules/questions/question_controller.dart';

class ListResult extends StatelessWidget {
  const ListResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return Obx(
      () => ListView.builder(
        itemCount: controller.questions.length,
        itemBuilder: (context, index) {
          final questionContent = controller.getQuestionContent(index);
          final selectedAnswer = controller.getSelectedAnswer(index);
          final correctAnswer = controller.getCorrectAnswer(index);

          bool isCorrect = selectedAnswer == correctAnswer;

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${index + 1}: $questionContent',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your Answer: ${selectedAnswer ?? 'None'}',
                    style:
                        TextStyle(color: isCorrect ? Colors.green : Colors.red),
                  ),
                  Text(
                    'Correct Answer: $correctAnswer',
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 8),
                  // Text(
                  //   isCorrect ? 'Correct' : 'Incorrect',
                  //   style: TextStyle(
                  //     color: isCorrect ? Colors.green : Colors.red,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
