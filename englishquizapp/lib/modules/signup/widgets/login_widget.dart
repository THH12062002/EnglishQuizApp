import 'package:englishquizapp/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends GetView<SignUpController> {
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
              Get.toNamed('/login');
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
