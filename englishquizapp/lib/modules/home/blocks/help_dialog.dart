// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HelpDialog extends StatelessWidget {
  HelpDialog({super.key});

  final List<Map<String, String>> helpPages = [
    {
      'image': 'assets/images/home_page.jpg',
      'text': 'Click button "Let\'s Play!" to choose the level of quiz.',
    },
    {
      'image': 'assets/images/chooselv.jpg',
      'text':
          'Choose one of three levels: Easy, Medium, Hard with 5 questions, 10 questions, 15 questions respectively.',
    },
    {
      'image': 'assets/images/question.jpg',
      'text':
          'Answer the questions, navigate with "Previous" or "Next", and flag questions with the "Flag" icon.',
    },
    {
      'image': 'assets/images/review.jpg',
      'text':
          'Review the question states, click a number to revisit a question, or "Submit" to finish.',
    },
    {
      'image': 'assets/images/result.jpg',
      'text':
          'See your results, score, and correct answers. Click "Restart Quiz", "Back to Home", or "Show Your Records".'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.maxFinite,
        height: 500,
        child: PageView.builder(
          itemCount: helpPages.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: 10),
                Image.asset(
                  helpPages[index]['image']!,
                  fit: BoxFit.contain,
                  height: 380, // Adjust the height to make the image larger
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    helpPages[index]['text']!,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    );
  }
}
