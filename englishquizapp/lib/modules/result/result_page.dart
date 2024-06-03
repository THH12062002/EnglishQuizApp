// result_page.dart
// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/data/service/repository.dart';
import 'package:englishquizapp/modules/home/home_page.dart';
import 'package:englishquizapp/modules/records/record_page.dart';
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
    Repository repository = Get.put(Repository());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 115, 102, 251),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30),
          HeadingResultBlock(),
          SizedBox(height: 5),
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
          SizedBox(height: 10),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(HomePage());
                },
                child: Text('Back to Home'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      repository.getRecords();
                      Get.to(() => RecordPage());
                    },
                    child: Text('Show Your Records'),
                  ),
                  SizedBox(width: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     controller.resetQuiz();
                  //     Get.to(() => ChooseLvPage());
                  //   },
                  //   child: Text('Home'),
                  // ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      controller.resetQuiz();
                      Get.to(() => ChooseLvPage());
                    },
                    child: Text('Restart Quiz'),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
