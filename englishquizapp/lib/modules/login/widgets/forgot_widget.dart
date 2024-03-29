import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotWidget extends StatelessWidget {
  const ForgotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password',
              style: GoogleFonts.raleway(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
