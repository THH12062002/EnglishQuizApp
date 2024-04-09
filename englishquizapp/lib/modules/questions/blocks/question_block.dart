import 'package:englishquizapp/data/models/question.dart';
import 'package:englishquizapp/data/models/quiz_question.dart';
import 'package:englishquizapp/data/service/question_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionBlock extends StatelessWidget {
  QuestionBlock({super.key});

  final _questionService = QuestionService();
  List<String> question = [];

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
          return ListView.builder(
            itemCount: question.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: questionList.length,
                    itemBuilder: (context, index) {
                      Questions question = questionList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.sp),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            question.content[index],
                            style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Text(
                  //   textAlign: TextAlign.center,
                  //   questionList[0].content,
                  //   style: GoogleFonts.raleway(
                  //     fontSize: 25,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.yellow,
                  //   ),
                  // ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
