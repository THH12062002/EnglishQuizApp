import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleRecordBlock extends StatelessWidget {
  const TitleRecordBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Your records',
      style: GoogleFonts.raleway(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
