import 'package:englishquizapp/data/models/question.dart';
import 'package:englishquizapp/data/service/question_service.dart';
import 'package:englishquizapp/modules/questions/widgets/answer_button.dart';
import 'package:flutter/material.dart';

class AnswerBlock extends StatelessWidget {
  AnswerBlock({super.key});

  List<String> answers = [];
  final QuestionService _questionService = QuestionService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _questionService.getQuestion(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Questions> answerList = snapshot.data ?? [];
            answers.add(answerList[0].ans1);
            answers.add(answerList[0].ans2);
            answers.add(answerList[0].ans3);
            answers.add(answerList[0].ans4);
            return SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnswerButton(answer: answers[index].toString()),
                    );
                  }),
            );
          }
        });
  }
}
