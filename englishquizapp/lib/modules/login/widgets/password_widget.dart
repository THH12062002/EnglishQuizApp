import 'package:englishquizapp/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordWidget extends GetView<LoginController> {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: 320,
      height: 60,
      child: TextFormField(
        controller: controller.passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.password),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
