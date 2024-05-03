import 'package:englishquizapp/modules/login/blocks/form_block.dart';
import 'package:englishquizapp/modules/login/blocks/logo_block.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(235, 115, 102, 251),
        ),
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 80),
              LogoBlock(),
              SizedBox(height: 75),
              FormBlock(),
            ],
          ),
        ),
      ),
    );
  }
}
