// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerBlock extends StatelessWidget {
  final RxInt questionIndex;

  const AnswerBlock({
    super.key,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return Obx(
      () {
        // Get the shuffled answers for the current question
        List<String> answersList =
            controller.shuffledAnswersLists[questionIndex.value]?.toList() ??
                [];

        return Column(
          children: List.generate(
            answersList.length,
            (index) => RadioListTile<int?>(
              value: index,
              groupValue:
                  controller.getSelectedAnswerIndex(questionIndex.value),
              onChanged: (int? value) {
                if (value != null) {
                  controller.saveQuestionState(questionIndex.value, value);
                  controller.selectAnswer(value);
                }
              },
              title: Text(
                answersList[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
      },
    );
  }
}
