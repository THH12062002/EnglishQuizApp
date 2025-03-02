// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionBlock extends GetView<QuestionController> {
  final RxInt questionIndex;

  const QuestionBlock({super.key, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Obx(
        () => Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
              child: Text(
                '${questionIndex.value + 1}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(235, 115, 102, 251)),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                controller.getQuestionContent(questionIndex.value),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
