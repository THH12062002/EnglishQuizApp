import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingBlock extends StatelessWidget {
  const HeadingBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Choose your level',
      style: GoogleFonts.raleway(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
