// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:englishquizapp/data/models/question.dart';

class QuestionBlock extends StatelessWidget {
  final Questions question;

  const QuestionBlock({required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        question.content,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.yellow),
        textAlign: TextAlign.center,
      ),
    );
  }
}
