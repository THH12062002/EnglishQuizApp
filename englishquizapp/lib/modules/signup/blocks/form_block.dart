import 'package:englishquizapp/modules/signup/widgets/signup_widget.dart';
import 'package:englishquizapp/modules/signup/widgets/email_widget.dart';
import 'package:englishquizapp/modules/signup/widgets/password_widget.dart';
import 'package:englishquizapp/modules/signup/widgets/login_widget.dart';
import 'package:englishquizapp/modules/signup/widgets/confirm_widget.dart';
import 'package:flutter/material.dart';

class FormBlock extends StatelessWidget {
  const FormBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      height: 600,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: const Column(
        children: [
          EmailWidget(),
          SizedBox(height: 20),
          PasswordWidget(),
          SizedBox(height: 20),
          ConfirmWidget(),
          SizedBox(height: 40),
          SignupWidget(),
          SizedBox(height: 40), // Add this line (1/2
          LoginWidget(),
        ],
      ),
    );
  }
}
