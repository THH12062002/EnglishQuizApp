// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/questions/question_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseBtnBlock extends StatelessWidget {
  const ChooseBtnBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuestionPage()));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Choose Level',
        style: GoogleFonts.raleway(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 115, 102, 251),
        ),
      ),
    );
  }
}
