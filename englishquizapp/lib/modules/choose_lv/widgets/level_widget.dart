// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:englishquizapp/modules/choose_lv/chooselv_controller.dart';
import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelWidget extends GetView<ChooseLvController> {
  const LevelWidget({super.key, required this.level, required this.difficulty});

  final String level;
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ChooseLvController());
    final questionController =
        Get.put<QuestionController>(QuestionController());
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 166, 0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          // Call the appropriate difficulty method from ChooseLvController
          switch (difficulty) {
            case 'onEasyLv':
              controller.onLvEasy();
              questionController.startQuiz('easy');
              break;
            case 'onMediumLv':
              controller.onLvMedium();
              questionController.startQuiz('medium');
              break;
            case 'onHardLv':
              controller.onLvHard();
              questionController.startQuiz('hard');
              break;
            default:
              break;
          }
        },
        child: Text(
          level,
          style: GoogleFonts.raleway(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
