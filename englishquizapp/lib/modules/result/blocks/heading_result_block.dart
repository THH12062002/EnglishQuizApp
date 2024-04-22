import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingResultBlock extends StatelessWidget {
  const HeadingResultBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Review your result',
      style: GoogleFonts.raleway(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
