// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/questions/blocks/questionflaghandle.dart';
import 'package:englishquizapp/modules/review/reviewscreen.dart';
import 'package:flutter/material.dart';
import 'package:englishquizapp/modules/questions/blocks/question_block.dart';
import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:englishquizapp/modules/questions/blocks/answer_block.dart';
//import 'package:englishquizapp/modules/result/result_screen.dart';
import 'package:englishquizapp/data/models/question.dart';

class QuestionViewer extends StatefulWidget {
  final List<Questions> questions;
  final List<QuestionState>? questionStates;
  final int? initialIndex;

  const QuestionViewer({
    Key? key,
    required this.questions,
    this.questionStates,
    this.initialIndex,
  }) : super(key: key);

  @override
  _QuestionViewerState createState() => _QuestionViewerState();
}

class _QuestionViewerState extends State<QuestionViewer> {
  int currentIndex = 0;
  int score = 0;
  late List<List<int>> selectedAnswerIndices;
  late List<bool> questionFlags;
  late List<QuestionState> questionStates;
  late List<int> flaggedQuestions = [];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? 0;
    selectedAnswerIndices = List.generate(widget.questions.length, (_) => []);
    questionFlags = List.generate(widget.questions.length, (_) => false);
    questionStates = widget.questionStates ??
        List.generate(widget.questions.length, (index) {
          return QuestionState(
            questionIndex: index,
            selectedAnswerIndex: -1,
            correctAnswerIndex: 0,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Score: $score',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        QuestionBlock(question: widget.questions[currentIndex]),
        SizedBox(height: 20),
        AnswerBlock(
          answers: widget.questions[currentIndex].answers,
          questionIndex: currentIndex,
          onAnswerSelected: (bool isCorrect) {
            selectedAnswerIndices[currentIndex] = [isCorrect ? 0 : -1];
            if (isCorrect) {
              setState(() {
                score += 100;
              });
            }
          },
          onQuestionStateChanged: (QuestionState state) {
            setState(() {
              questionStates[state.questionIndex] = state;
            });
          },
          questionStates: questionStates,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentIndex > 0) currentIndex--;
                });
              },
              child: Text('Previous'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => _moveToNextQuestion(),
              child: Text('Next'),
            ),
            SizedBox(width: 20),
            QuestionFlagHandle(
              isFlagged: questionFlags[currentIndex],
              onFlagChanged: (isFlagged) {
                setState(() {
                  questionFlags[currentIndex] = isFlagged;
                  if (isFlagged) {
                    flaggedQuestions.add(currentIndex);
                  } else {
                    flaggedQuestions.remove(currentIndex);
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  void _moveToNextQuestion() {
    setState(() {
      if (currentIndex < widget.questions.length - 1) {
        currentIndex++;
      } else {
        for (int i = 0; i < widget.questions.length; i++) {
          questionStates[i] = QuestionState(
            questionIndex: i,
            selectedAnswerIndex: selectedAnswerIndices[i].isNotEmpty
                ? selectedAnswerIndices[i][0]
                : null,
            correctAnswerIndex: 0,
          );
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReviewScreen(
              questions: widget.questions,
              questionStates: questionStates,
              flaggedQuestions: flaggedQuestions,
            ),
          ),
        );
      }
    });
  }
}
