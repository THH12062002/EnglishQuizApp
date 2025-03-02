import 'package:englishquizapp/modules/signup/blocks/logo_block.dart';
import 'package:englishquizapp/modules/signup/blocks/form_block.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(235, 115, 102, 251),
        ),
        child: const SingleChildScrollView(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                LogoBlock(),
                SizedBox(height: 50),
                FormBlock(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
