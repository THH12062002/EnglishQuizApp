//import 'package:englishquizapp/modules/questions/question_screen.dart';
// ignore_for_file: prefer_const_constructors

//import 'package:englishquizapp/modules/choose_lv/chooselv.dart';
import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:englishquizapp/modules/questions/question_screen.dart';
//import 'package:englishquizapp/modules/questions/blocks/question_viewer.dart';
import 'package:englishquizapp/modules/result/blocks/heading_result_block.dart';
import 'package:englishquizapp/modules/result/result_screen.dart';
import 'package:englishquizapp/modules/review/blocks/list_answer.dart';
import 'package:flutter/material.dart';
import 'package:englishquizapp/data/models/question.dart';

class ReviewScreen extends StatelessWidget {
  final List<QuestionState> questionStates;
  final List<Questions> questions;
  final List<int> flaggedQuestions;

  const ReviewScreen({
    super.key,
    required this.questionStates,
    required this.questions,
    required this.flaggedQuestions,
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
            child: ListAnswer(
              questions: questions,
              questionStates: questionStates,
              flaggedQuestions: flaggedQuestions,
              onEditPressed: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(
                      questions: questions,
                      questionStates: questionStates,
                      initialIndex: index,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    questions: questions,
                    questionStates: questionStates,
                    flaggedQuestions: flaggedQuestions,
                  ),
                ),
              );
            },
            child: Text('Submit Answer'),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
