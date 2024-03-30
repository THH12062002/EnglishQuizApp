import 'package:englishquizapp/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutBlock extends StatelessWidget {
  const LogoutBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.65,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Login()));
        },
        child: Text(
          'Logout',
          style: GoogleFonts.raleway(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
