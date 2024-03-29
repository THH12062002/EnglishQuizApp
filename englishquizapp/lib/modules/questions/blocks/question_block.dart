import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionBlock extends StatelessWidget {
  const QuestionBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Question in here.',
      style: GoogleFonts.raleway(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.yellow,
      ),
    );
  }
}
