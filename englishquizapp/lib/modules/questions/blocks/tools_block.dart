import 'package:englishquizapp/data/storage/questions_storage.dart';
import 'package:englishquizapp/modules/result/result_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ToolsBlock extends StatelessWidget {
  const ToolsBlock({super.key});
  @override
  Widget build(BuildContext context) {
    var seconds = 0;
    QuestionStorage questionStorage = QuestionStorage();
    if (questionStorage.getDifficultyAtIndex(0.obs) == "easy") {
      seconds = 100;
    } else if (questionStorage.getDifficultyAtIndex(0.obs) == "medium") {
      seconds = 200;
    } else if (questionStorage.getDifficultyAtIndex(0.obs) == "hard") {
      seconds = 300;
    }
    return Row(
      children: [
        const SizedBox(width: 15),
        Text(
          '1/10',
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
        const SizedBox(width: 125),
        Row(
          children: [
            const Icon(Icons.timer_outlined, color: Colors.yellow, size: 30),
            Countdown(
              seconds: seconds,
              build: (BuildContext context, double time) {
                return Text(
                  time.toString().replaceFirst(".0", ""),
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                );
              },
              onFinished: () => {
                Get.to(() => ResultPage()) // Navigate to ResultPage
              },
            ),
          ],
        ),
        const SizedBox(width: 80),
        Text(
          'Score',
          style: GoogleFonts.lato(
            fontSize: 20,
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
