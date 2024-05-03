import 'package:englishquizapp/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsernameWidget extends GetView<LoginController> {
  const UsernameWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: 320,
      height: 60,
      child: TextFormField(
        controller: controller.usernameController,
        decoration: const InputDecoration(
          hintText: 'Username',
          prefixIcon: Icon(Icons.verified_user_outlined),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
