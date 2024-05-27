// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:englishquizapp/modules/questions/question_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAnswer extends StatelessWidget {
  const ListAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return Obx(
      () => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // Number of columns in the grid
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: controller.questions.length,
        itemBuilder: (context, index) {
          final selectedAnswerIndex = controller.getSelectedAnswerIndex(index);
          final isAnswered =
              selectedAnswerIndex != null && selectedAnswerIndex >= 0;
          final isFlagged = index < controller.questionStates.length
              ? controller.questionStates[index].isFlagged ?? false
              : false;

          Color backgroundColor;
          if (isFlagged) {
            backgroundColor = const Color.fromARGB(255, 110, 230, 114);
          } else if (isAnswered) {
            backgroundColor = const Color.fromARGB(255, 110, 230, 114);
          } else {
            backgroundColor = Colors.grey;
          }

          return GestureDetector(
            onTap: () {
              controller.currentIndex.value = index; // Update current index
              controller
                  .shuffleAndDisplayCurrentQuestionAnswers(); // Shuffle answers
              Get.to(QuestionPage());
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (isFlagged)
                  Positioned(
                    right: 4.0,
                    top: 4.0,
                    child: Icon(
                      Icons.flag,
                      color: Colors.red,
                      size: 16.0,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
