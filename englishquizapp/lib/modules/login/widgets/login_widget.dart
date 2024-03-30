import 'package:englishquizapp/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(320, 55),
        backgroundColor: const Color.fromARGB(255, 255, 166, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Login',
        style: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
