// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:englishquizapp/modules/questions/blocks/question_viewer.dart';
import 'package:englishquizapp/modules/questions/blocks/tools_block.dart';
import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionPage extends GetView<QuestionController> {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      // Call loadQuestions after a short delay
      controller.loadQuestions();
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(235, 115, 102, 251),
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 70),
              const ToolsBlock(),
              const SizedBox(height: 130),
              QuestionViewer(),
            ],
          ),
        ),
      ),
    );
  }
}
