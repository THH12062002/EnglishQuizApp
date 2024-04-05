import 'package:englishquizapp/data/models/question.dart';
import 'package:englishquizapp/data/service/question_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionBlock extends StatelessWidget {
  QuestionBlock({super.key});

  final _questionService = QuestionService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Questions>>(
        future: _questionService.getQuestion(),
        builder: (context, AsyncSnapshot<List<Questions>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Questions> questionList = snapshot.data ?? [];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              child: Text(
                textAlign: TextAlign.center,
                questionList[0].content,
                style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            );
          }
        });

    // Text(
    //   'Question in here.',
    //   style: GoogleFonts.raleway(
    //     fontSize: 25,
    //     fontWeight: FontWeight.bold,
    //     color: Colors.yellow,
    //   ),
    // );
  }
}
