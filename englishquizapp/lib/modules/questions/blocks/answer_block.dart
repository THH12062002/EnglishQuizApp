import 'package:englishquizapp/modules/questions/widgets/answer_button.dart';
import 'package:flutter/material.dart';

class AnswerBlock extends StatelessWidget {
  const AnswerBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AnswerButton(answer: 'Answer 1'),
        SizedBox(height: 15),
        AnswerButton(answer: 'Answer 2'),
        SizedBox(height: 15),
        AnswerButton(answer: 'Answer 3'),
        SizedBox(height: 15),
        AnswerButton(answer: 'Answer 4'),
      ],
    );
  }
}
