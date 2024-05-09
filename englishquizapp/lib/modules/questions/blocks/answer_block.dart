// ignore_for_file: library_private_types_in_public_api

import 'package:englishquizapp/data/storage/questions_storage.dart';
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
    //int? selectedAnswerIndex;
    final controller = Get.put(QuestionController());
    QuestionStorage questionStorage = Get.find<QuestionStorage>();

    controller.updateAnswersList(questionStorage, questionIndex);

    return Obx(
      () => Column(
        children: List.generate(
          controller.answersList.length,
          (index) => RadioListTile<int?>(
            value: index,
            groupValue: controller.selectedAnswerIndex.value,
            onChanged: (int? value) {
              controller.selectedAnswerIndex.value = index;
              // widget.onAnswerSelected(
              //     index == 0); // Assuming index 0 is always the correct answer
              // // Lưu trạng thái của câu hỏi và câu trả lời đã chọn
              // _saveQuestionState(index);
            },
            title: Obx(
              () => Text(
                controller.answersList[index],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
