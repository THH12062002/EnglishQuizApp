import 'package:englishquizapp/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 130),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?',
            style: GoogleFonts.raleway(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: Text(
              'Login',
              style: GoogleFonts.raleway(
                fontSize: 16,
                color: const Color.fromARGB(255, 255, 166, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
