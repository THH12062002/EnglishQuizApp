// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:englishquizapp/data/models/user.dart';
import 'package:englishquizapp/data/service/repository.dart';
import 'package:englishquizapp/modules/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginRepository loginRepository = LoginRepository();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void onLogin() {
    final String username = usernameController.text;
    final String password = passwordController.text;
    var user = loginRepository.loginUser(username, password);
    if (user != null) {
      Get.toNamed('/home');
    }
  }
}
