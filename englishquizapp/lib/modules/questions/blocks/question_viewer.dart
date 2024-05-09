// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:englishquizapp/modules/questions/blocks/answer_block.dart';
import 'package:englishquizapp/modules/questions/blocks/question_block.dart';
import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionViewer extends StatelessWidget {
  const QuestionViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Obx(() => Text(
        //       'Score: $controller.score.value',
        //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //     )),
        SizedBox(height: 20),
        QuestionBlock(
          questionIndex: controller.currentIndex,
        ),
        SizedBox(height: 20),
        AnswerBlock(questionIndex: controller.currentIndex),
        // AnswerBlock(
        //   answers: controller.questions[currentIndex].answers,
        //   questionIndex: currentIndex,
        //   onAnswerSelected: (bool isCorrect) {
        //     selectedAnswerIndices[currentIndex] = [isCorrect ? 0 : -1];
        //     if (isCorrect) {
        //       controller.incrementScore();
        //     }
        //   },
        //   onQuestionStateChanged: (QuestionState state) {
        //     setState(() {
        //       questionStates[state.questionIndex] = state;
        //     });
        //   },
        //   questionStates: questionStates,
        // ),
        SizedBox(height: 20),
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
            // QuestionFlagHandle(
            //   isFlagged: questionFlags[currentIndex],
            //   onFlagChanged: (isFlagged) {
            //     setState(() {
            //       questionFlags[currentIndex] = isFlagged;
            //       if (isFlagged) {
            //         flaggedQuestions.add(currentIndex);
            //       } else {
            //         flaggedQuestions.remove(currentIndex);
            //       }
            //     });
            //   },
            // ),
          ],
        ),
      ],
    );
  }
}
