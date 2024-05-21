// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:englishquizapp/modules/result/blocks/heading_result_block.dart';
import 'package:englishquizapp/modules/result/result_page.dart';
import 'package:englishquizapp/modules/review/blocks/list_answer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          HeadingResultBlock(), // Heading block của bạn
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListAnswer(), // Sử dụng ListAnswer
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => ResultPage()); // Navigate to ResultPage
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
