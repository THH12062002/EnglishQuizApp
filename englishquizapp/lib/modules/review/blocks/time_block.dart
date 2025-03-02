import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeBlock extends StatelessWidget {
  const TimeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return Row(
      children: [
        const SizedBox(width: 130),
        Row(
          children: [
            const Icon(Icons.timer_outlined, color: Colors.yellow, size: 30),
            Obx(
              () => Text(
                'Time remaining: ${controller.countdownSeconds.value.toString()}',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
