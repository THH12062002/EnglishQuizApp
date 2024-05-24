import 'package:englishquizapp/modules/login/widgets/email_widget.dart';
import 'package:englishquizapp/modules/login/widgets/login_widget.dart';
import 'package:englishquizapp/modules/login/widgets/password_widget.dart';
import 'package:englishquizapp/modules/login/widgets/signup_widget.dart';
import 'package:flutter/material.dart';

class FormBlock extends StatelessWidget {
  const FormBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      height: 520,
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
          SizedBox(height: 16),
          PasswordWidget(),
          // ForgotWidget(),
          SizedBox(height: 20),
          LoginWidget(),
          SizedBox(height: 30),
          SingupWidget(),
        ],
      ),
    );
  }
}
