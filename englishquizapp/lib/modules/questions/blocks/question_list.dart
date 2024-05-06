// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/data/models/question.dart';
import 'package:englishquizapp/data/service/question_service.dart';
import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:englishquizapp/modules/questions/blocks/question_viewer.dart';
import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final QuestionService _questionService = QuestionService();
  final List<Questions>? questions;
  final List<QuestionState>? questionStates;
  final int? initialIndex;

  QuestionList({
    super.key,
    this.questions,
    this.questionStates,
    this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Questions>>(
      future: _questionService.getQuestionsFromFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Questions> questions = snapshot.data ?? [];
          return QuestionViewer(
            questions: questions,
            questionStates:
                questionStates, // Truyền questionStates vào QuestionViewer
            initialIndex: initialIndex,
          );
        }
      },
    );
  }
}
