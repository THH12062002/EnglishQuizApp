import 'package:englishquizapp/data/service/repository.dart';
import 'package:englishquizapp/data/storage/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final UserStorage userStorage = Get.put<UserStorage>(UserStorage());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Repository repository = Repository();

  Future<void> onSignUp() async {
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    if (email.isNotEmpty || password.isNotEmpty || confirmPassword.isNotEmpty) {
      if (password != confirmPassword) {
        Get.snackbar('Thông báo', 'Mật khẩu không khớp');
        return;
      } else {
        var user = await repository.registerUser(email, password);
        if (user.email != null &&
            user.password != null &&
            password == confirmPassword) {
          Get.snackbar('Thông báo', 'Đăng ký thành công');
          userStorage.saveUser(email, password);
          Get.toNamed('/login');
        } else {
          Get.snackbar('Thông báo', 'Đăng ký thất bại');
        }
      }
    }
  }
}
