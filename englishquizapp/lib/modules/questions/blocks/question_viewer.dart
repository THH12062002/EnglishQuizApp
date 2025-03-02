// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:englishquizapp/modules/questions/blocks/answer_block.dart';
import 'package:englishquizapp/modules/questions/blocks/question_block.dart';
import 'package:englishquizapp/modules/questions/blocks/questionflaghandle.dart';
import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionViewer extends StatelessWidget {
  const QuestionViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        QuestionBlock(
          questionIndex: controller.currentIndex,
        ),
        SizedBox(height: 20),
        AnswerBlock(questionIndex: controller.currentIndex),
        SizedBox(height: 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.moveToPreviousQuestion();
              },
              child: Text('Previous'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => controller.moveToNextQuestion(),
              child: Text('Next'),
            ),
            SizedBox(width: 20),
            QuestionFlagHandle(),
          ],
        ),
      ],
    );
  }
}
