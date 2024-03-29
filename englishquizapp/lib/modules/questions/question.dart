import 'package:englishquizapp/modules/login/login.dart';
import 'package:englishquizapp/modules/questions/blocks/answer_block.dart';
import 'package:englishquizapp/modules/questions/blocks/question_block.dart';
import 'package:englishquizapp/modules/questions/blocks/tools_block.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key});

  //final void Function() ;

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
              const SizedBox(height: 230),
              const QuestionBlock(),
              const SizedBox(height: 30),
              const AnswerBlock(),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text(
                  'Back to Login',
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
