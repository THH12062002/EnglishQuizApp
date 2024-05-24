import 'package:englishquizapp/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmPasswordWidget extends GetView<SignUpController> {
  const ConfirmPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: 320,
      height: 60,
      child: TextFormField(
        controller: controller.confirmPasswordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Confirm Password',
          prefixIcon: Icon(Icons.confirmation_num_outlined),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
