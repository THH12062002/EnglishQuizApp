import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ToolsBlock extends StatelessWidget {
  const ToolsBlock({super.key});
  @override
  Widget build(BuildContext context) {
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
              seconds: 10,
              build: (BuildContext context, double time) {
                return Text(
                  time.toString(),
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                );
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
