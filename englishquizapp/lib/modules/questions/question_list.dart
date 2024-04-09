// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/data/models/question.dart';
import 'package:englishquizapp/data/service/question_service.dart';
import 'package:englishquizapp/question_viewer.dart';
import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final QuestionService _questionService = QuestionService();

  QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Questions>>(
      future: _questionService
          .getQuestionsFromFirebase(), // Function to fetch questions
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Questions> questions = snapshot.data ?? [];
          return QuestionViewer(questions: questions);
        }
      },
    );
  }
}
