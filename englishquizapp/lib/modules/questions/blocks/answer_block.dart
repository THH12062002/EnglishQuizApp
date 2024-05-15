// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerBlock extends StatelessWidget {
  final RxInt questionIndex;

  const AnswerBlock({
    Key? key,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return Obx(
      () => Column(
        children: List.generate(
          controller.answersList.length,
          (index) => RadioListTile<int?>(
            value: index,
            groupValue: controller.getSelectedAnswerIndex(
                questionIndex.value), // Update groupValue
            onChanged: (int? value) {
              if (value != null) {
                controller.saveQuestionState(questionIndex.value,
                    value); // Save the selected answer for this question
                controller.selectAnswer(value); // Handle the answer selection
              }
            },
            title: Text(
              controller.answersList[index],
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
