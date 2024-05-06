import 'package:englishquizapp/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SingupWidget extends GetView<LoginController> {
  const SingupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 130),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: GoogleFonts.raleway(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/signup');
            },
            child: Text(
              'Sign Up',
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
