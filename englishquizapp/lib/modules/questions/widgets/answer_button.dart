import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer});

  final String answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          answer,
          style: GoogleFonts.raleway(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(235, 115, 102, 251),
          ),
        ),
      ),
    );
  }
}
