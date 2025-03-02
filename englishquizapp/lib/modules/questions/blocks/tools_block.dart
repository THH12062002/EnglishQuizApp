import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ToolsBlock extends StatelessWidget {
  const ToolsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return Row(
      children: [
        const SizedBox(width: 20),
        Obx(() => Text(
              'Question: ${controller.currentIndex.value + 1}/${controller.getTotalQuestions()}',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            )),
        const SizedBox(width: 60),
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
