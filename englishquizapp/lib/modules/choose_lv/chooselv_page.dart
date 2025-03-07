import 'package:englishquizapp/modules/choose_lv/blocks/heading_block.dart';
import 'package:englishquizapp/modules/choose_lv/blocks/level_block.dart';
import 'package:flutter/material.dart';

class ChooseLvPage extends StatelessWidget {
  const ChooseLvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(235, 115, 102, 251),
        ),
        alignment: Alignment.topCenter,
        child: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 80),
              HeadingBlock(),
              SizedBox(height: 230),
              LevelBlock(),
            ],
          ),
        ),
      ),
    );
  }
}
