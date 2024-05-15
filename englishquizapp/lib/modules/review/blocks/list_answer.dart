// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/data/storage/questions_storage.dart';
import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAnswer extends StatelessWidget {
  const ListAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();
    QuestionStorage questionStorage = QuestionStorage();

    return Obx(
      () => ListView.builder(
        itemCount: controller.questions.length,
        itemBuilder: (context, index) {
          final selectedAnswerIndex = controller.getSelectedAnswerIndex(index);
          final selectedAnswer = selectedAnswerIndex != null
              ? controller.answersList[selectedAnswerIndex]
              : 'Chưa có';

          final correctAnswer =
              questionStorage.getCorrectAnswerAtIndex(RxInt(index));

          return Card(
            child: ListTile(
              title: Text('Question ${index + 1}:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selected Answer: $selectedAnswer'),
                  Text('Correct Answer: $correctAnswer'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
