// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:englishquizapp/data/models/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionViewer extends StatefulWidget {
  final List<Questions> questions;

  const QuestionViewer({super.key, required this.questions});

  @override
  _QuestionViewerState createState() => _QuestionViewerState();
}

class _QuestionViewerState extends State<QuestionViewer> {
  int currentIndex = 0;
  int score = 0;
  List<bool?> answerStates = List.generate(4, (_) => null);
  bool answered = false; // Flag to track if the question has been answered

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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            widget.questions[currentIndex].content,
            style: GoogleFonts.raleway(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: List.generate(widget.questions[currentIndex].answers.length,
              (index) {
            String answer = widget.questions[currentIndex].answers[index];
            return GestureDetector(
              onTap: () {
                if (!answered) {
                  // Check if the question has been answered
                  setState(() {
                    // Check if the tapped answer is correct (ans1)
                    if (index == 0) {
                      score += 100;
                      answerStates[index] = true;
                    } else {
                      answerStates[index] = false;
                    }
                    answered =
                        true; // Set answered to true after processing the answer
                  });
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      // Move to the next question if available
                      if (currentIndex < widget.questions.length - 1) {
                        currentIndex++;
                        // Reset answer states for the new question
                        answerStates = List.generate(4, (_) => null);
                        answered =
                            false; // Reset answered flag for the new question
                      }
                    });
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: answerStates[index] == null
                      ? Colors.transparent // No color if answer not selected
                      : answerStates[index]!
                          ? Colors.green // Green for correct answer
                          : Colors.red, // Red for incorrect answer
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          answer,
                          style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                    answerStates[index] == null
                        ? SizedBox() // Show nothing if answer not selected
                        : answerStates[index]!
                            ? Icon(Icons.check,
                                color: Colors.white,
                                size: 20) // Show check mark for correct answer
                            : Icon(Icons.close,
                                color: Colors.white,
                                size:
                                    20), // Show cross mark for incorrect answer
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}





        // SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {
        //         setState(() {
        //           if (currentIndex > 0) currentIndex--;
        //         });
        //       },
        //       child: Text('Previous'),
        //     ),
        //     SizedBox(width: 20),
        //     ElevatedButton(
        //       onPressed: () {
        //         setState(() {
        //           if (currentIndex < widget.questions.length - 1)
        //             currentIndex++;
        //         });
        //       },
        //       child: Text('Next'),
        //     ),
        //   ],
        // ),


        // SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {
        //         setState(() {
        //           if (currentIndex > 0) currentIndex--;
        //         });
        //       },
        //       child: Text('Previous'),
        //     ),
        //     SizedBox(width: 20),
        //     ElevatedButton(
        //       onPressed: () {
        //         setState(() {
        //           if (currentIndex < widget.questions.length - 1)
        //             currentIndex++;
        //         });
        //       },
        //       child: Text('Next'),
        //     ),
        //   ],
        // ),

