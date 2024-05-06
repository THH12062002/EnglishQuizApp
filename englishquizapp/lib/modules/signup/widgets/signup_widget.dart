import 'package:englishquizapp/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupWidget extends GetView<SignUpController> {
  const SignupWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.onSignUp();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(320, 55),
        backgroundColor: const Color.fromARGB(255, 255, 166, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Sign Up',
        style: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
