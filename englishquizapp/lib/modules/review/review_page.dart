// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:englishquizapp/modules/result/blocks/heading_result_block.dart';
import 'package:englishquizapp/modules/review/blocks/list_answer.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 115, 102, 251),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 80),
          HeadingResultBlock(),
          SizedBox(height: 20),
          Expanded(child: ListAnswer()),
        ],
      ),
    );
  }
}
