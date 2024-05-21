// result_page.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:englishquizapp/modules/choose_lv/chooselv_page.dart';
import 'package:englishquizapp/modules/result/blocks/heading_result_block.dart';
import 'package:englishquizapp/modules/result/blocks/list_result.dart';
import 'package:get/get.dart';
import 'package:englishquizapp/modules/questions/question_controller.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 115, 102, 251),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 80),
          HeadingResultBlock(),
          SizedBox(height: 20),
          Expanded(
            child: ListResult(),
          ),
          SizedBox(height: 20),
          Text(
            'Correct Answers: ${controller.score.value ~/ 100} / ${controller.getTotalQuestions()}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Score: ${controller.score.value}', // Each correct answer gives 100 points
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.resetQuiz();
              Get.to(() => ChooseLvPage());
            },
            child: Text('Restart Quiz'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
