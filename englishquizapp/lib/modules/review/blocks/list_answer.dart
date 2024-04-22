// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:flutter/material.dart';
import 'package:englishquizapp/data/models/question.dart';

class ListAnswer extends StatelessWidget {
  final List<Questions> questions;
  final List<QuestionState> questionStates;
  final List<int> flaggedQuestions;
  final Function(int)
      onEditPressed; // Thêm hàm callback để xử lý sự kiện chỉnh sửa

  const ListAnswer({
    Key? key,
    required this.questions,
    required this.questionStates,
    required this.flaggedQuestions,
    required this.onEditPressed, // Thêm vào constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        final selectedAnswerIndex = questionStates[index].selectedAnswerIndex;
        final selectedAnswer = selectedAnswerIndex != null &&
                selectedAnswerIndex >= 0 &&
                selectedAnswerIndex < question.answers.length
            ? question.answers[selectedAnswerIndex]
            : 'Chưa chọn';

        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Question ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    if (flaggedQuestions.contains(index))
                      Icon(Icons.flag, color: Colors.yellow),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.edit), // Icon chỉnh sửa
                      onPressed: () {
                        // Khi nút chỉnh sửa được nhấn, gọi hàm callback onEditPressed
                        onEditPressed(index);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  question.content,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Your Answer: $selectedAnswer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
