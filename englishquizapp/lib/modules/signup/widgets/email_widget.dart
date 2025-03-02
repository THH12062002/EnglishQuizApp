import 'package:englishquizapp/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailWidget extends GetView<SignUpController> {
  const EmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: 320,
      height: 60,
      child: TextFormField(
        controller: controller.emailController,
        decoration: const InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email_outlined),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
