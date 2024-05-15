// // ignore_for_file: prefer_const_constructors

// import 'package:englishquizapp/data/models/question.dart';
// import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ListResult extends StatelessWidget {
//   final List<Questions> questions;
//   final List<QuestionState> questionStates;
//   final List<int> flaggedQuestions;

//   const ListResult({
//     Key? key,
//     required this.questions,
//     required this.questionStates,
//     required this.flaggedQuestions,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: questions.length,
//         itemBuilder: (context, index) {
//           final question = questions[index];
//           final questionState = questionStates[index];
//           final selectedAnswerIndex = questionState.selectedAnswerIndex;
//           final selectedAnswer = selectedAnswerIndex != null &&
//                   selectedAnswerIndex >= 0 &&
//                   selectedAnswerIndex < question.answers.length
//               ? question.answers[selectedAnswerIndex]
//               : 'Chưa chọn';
//           //final correctAnswerIndex = questionState.correctAnswerIndex;
//           // final correctAnswer = correctAnswerIndex != -1
//           //     ? question.answers[correctAnswerIndex]
//           //     : 'Không có đáp án';

//           Color textColor = selectedAnswer == correctAnswer
//               ? const Color.fromARGB(255, 38, 229, 45)
//               : Color.fromARGB(255, 222, 19, 5);

//           // Check if the question is flagged
//           bool isFlagged = flaggedQuestions.contains(index);

//           return Row(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(left: 10),
//                 width: 30,
//                 height: 30,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: textColor,
//                 ),
//                 child: Text(
//                   '${index + 1}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 16),
//               Expanded(
//                 child: ListTile(
//                   title: Text(question.content),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Your answer: $selectedAnswer',
//                           style: GoogleFonts.raleway(
//                             color: textColor,
//                           )),
//                       Text(
//                         'Correct answer: $correctAnswer',
//                         style: GoogleFonts.raleway(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(
//                   isFlagged ? Icons.flag : Icons.outlined_flag,
//                   color: isFlagged ? Colors.yellow : Colors.grey,
//                 ),
//                 onPressed: () {
//                   // Add logic to handle flagging/unflagging questions
//                 },
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
