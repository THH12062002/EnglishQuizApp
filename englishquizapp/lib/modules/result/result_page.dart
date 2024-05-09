//import 'package:englishquizapp/modules/questions/question_screen.dart';
// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/data/models/question.dart';
import 'package:englishquizapp/modules/choose_lv/chooselv_page.dart';
import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:englishquizapp/modules/result/blocks/heading_result_block.dart';
import 'package:englishquizapp/modules/result/blocks/list_result.dart';
import 'package:englishquizapp/modules/review/review_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final List<Questions> questions;
  final List<QuestionState> questionStates;
  final List<int> flaggedQuestions; // Thêm tham số flaggedQuestions

  const ResultPage({
    super.key,
    required this.questions,
    required this.questionStates,
    required this.flaggedQuestions, // Cập nhật constructor để nhận tham số flaggedQuestions
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 115, 102, 251),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 80),
          HeadingResultBlock(),
          SizedBox(height: 20),
          Expanded(
            child: ListResult(
              questions: questions,
              questionStates: questionStates,
              flaggedQuestions:
                  flaggedQuestions, // Truyền tham số flaggedQuestions vào ListResult
            ),
          ),
          SizedBox(height: 5),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => ReviewPage(
          //           questions: questions,
          //           questionStates: questionStates,
          //           flaggedQuestions: flaggedQuestions,
          //         ),
          //       ),
          //     );
          //   },
          //   child: Text('Return to Review Screen'),
          // ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseLvPage(),
                ),
              );
            },
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
