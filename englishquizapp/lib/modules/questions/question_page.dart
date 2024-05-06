import 'package:englishquizapp/data/models/question.dart';
import 'package:englishquizapp/modules/home/home_page.dart';
import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:englishquizapp/modules/questions/blocks/tools_block.dart';
import 'package:englishquizapp/modules/questions/blocks/question_list.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  final List<Questions>? questions;
  final List<QuestionState>? questionStates;
  final int? initialIndex;

  const QuestionPage({
    Key? key,
    this.questions,
    this.questionStates,
    this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(235, 115, 102, 251),
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              const ToolsBlock(),
              const SizedBox(height: 180),
              QuestionList(
                questions: questions,
                questionStates:
                    questionStates, // Truyền questionStates vào QuestionList
                initialIndex: initialIndex,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: const Text(
                  'Back to Home',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
