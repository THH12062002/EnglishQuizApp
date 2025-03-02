import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionFlagHandle extends StatelessWidget {
  const QuestionFlagHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();
    return Obx(
      () => IconButton(
        iconSize: 24,
        icon: Icon(
          controller.isCurrentQuestionFlagged.value
              ? Icons.flag
              : Icons.outlined_flag,
          color: controller.isCurrentQuestionFlagged.value
              ? Colors.yellow
              : Colors.grey,
        ),
        onPressed: () {
          bool newFlagState = !controller.isCurrentQuestionFlagged.value;
          controller.flagQuestion(controller.currentIndex.value, newFlagState);
        },
      ),
    );
  }
}
