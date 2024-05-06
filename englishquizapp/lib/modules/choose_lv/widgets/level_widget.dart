// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:englishquizapp/modules/choose_lv/chooselv_controller.dart';
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
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 166, 0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          // Gọi phương thức tương ứng với difficulty từ ChooseLvController
          switch (difficulty) {
            case 'onEasyLv':
              controller.onLvEasy();
              break;
            case 'onMediumLv':
              controller.onLvMedium();
              break;
            case 'onHardLv':
              controller.onLvHard();
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
