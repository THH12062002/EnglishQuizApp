// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/data/service/repository.dart';
import 'package:englishquizapp/data/storage/user_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final UserStorage userStorage = Get.put<UserStorage>(UserStorage());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Repository repository = Repository();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  Future<void> onLogin() async {
    final String email = usernameController.text;
    final String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Thông báo', 'Vui lòng nhập đầy đủ thông tin');
    } else {
      var user = await repository.loginUser(email, password);
      if (user?.email != null && user?.password != null) {
        userStorage.saveUser(email, password);
        Get.toNamed('/home');
      }
    }
  }
}
