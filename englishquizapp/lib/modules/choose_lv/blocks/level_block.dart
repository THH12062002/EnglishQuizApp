// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/choose_lv/chooselv_controller.dart';
import 'package:englishquizapp/modules/choose_lv/widgets/level_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LevelBlock extends GetView<ChooseLvController> {
  const LevelBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LevelWidget(level: 'Easy', difficulty: "onEasyLv"),
        SizedBox(height: 40),
        LevelWidget(level: 'Medium', difficulty: "onMediumLv"),
        SizedBox(height: 40),
        LevelWidget(level: 'Hard', difficulty: "onHardLv"),
        SizedBox(height: 80),
        TextButton(
            onPressed: () {
              Get.toNamed('/home');
            },
            child: Text('Back to Home')),
      ],
    );
  }
}
