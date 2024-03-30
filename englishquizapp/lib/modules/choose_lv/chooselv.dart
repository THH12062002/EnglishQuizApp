import 'package:englishquizapp/modules/choose_lv/blocks/heading_block.dart';
import 'package:englishquizapp/modules/choose_lv/blocks/level_block.dart';
import 'package:flutter/material.dart';

class ChooseLv extends StatelessWidget {
  const ChooseLv({super.key});

  //final void Function() ;

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
