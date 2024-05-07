// ignore_for_file: library_private_types_in_public_api

import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:flutter/material.dart';

class AnswerBlock extends StatefulWidget {
  final List<String> answers;
  final int questionIndex;
  final Function(bool) onAnswerSelected;
  final Function(QuestionState) onQuestionStateChanged;
  final List<QuestionState> questionStates;

  const AnswerBlock({
    super.key,
    required this.answers,
    required this.questionIndex,
    required this.onAnswerSelected,
    required this.onQuestionStateChanged,
    required this.questionStates,
  });

  @override
  _AnswerBlockState createState() => _AnswerBlockState();
}

class _AnswerBlockState extends State<AnswerBlock> {
  int? selectedAnswerIndex;

  @override
  void initState() {
    super.initState();
    // Set selectedAnswerIndex to the index of the selected answer if it's already selected
    if (widget.questionIndex < widget.questionStates.length) {
      selectedAnswerIndex =
          widget.questionStates[widget.questionIndex].selectedAnswerIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.answers.length,
        (index) => RadioListTile<int?>(
          value: index,
          groupValue: selectedAnswerIndex,
          onChanged: (int? value) {
            setState(() {
              selectedAnswerIndex = value;
            });
            widget.onAnswerSelected(
                index == 0); // Assuming index 0 is always the correct answer
            // Lưu trạng thái của câu hỏi và câu trả lời đã chọn
            _saveQuestionState(index);
          },
          title: Text(
            widget.answers[index],
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  void _saveQuestionState(int selectedIndex) {
    int correctAnswerIndex = 0; // Giả sử đáp án đúng luôn ở index 0
    // Lưu trạng thái của câu hỏi và câu trả lời đã chọn
    widget.onQuestionStateChanged(QuestionState(
      questionIndex: widget.questionIndex,
      selectedAnswerIndex: selectedIndex,
      correctAnswerIndex: correctAnswerIndex,
    ));
  }

  @override
  void didUpdateWidget(covariant AnswerBlock oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update selectedAnswerIndex when the widget is updated
    if (widget.questionIndex < widget.questionStates.length) {
      selectedAnswerIndex =
          widget.questionStates[widget.questionIndex].selectedAnswerIndex;
    } else {
      selectedAnswerIndex = null;
    }
  }
}
