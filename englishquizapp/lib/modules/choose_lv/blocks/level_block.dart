import 'package:englishquizapp/modules/choose_lv/widgets/level_widget.dart';
import 'package:flutter/material.dart';

class LevelBlock extends StatelessWidget {
  const LevelBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LevelWidget(level: 'Easy'),
        SizedBox(height: 40),
        LevelWidget(level: 'Medium'),
        SizedBox(height: 40),
        LevelWidget(level: 'Hard'),
      ],
    );
  }
}
