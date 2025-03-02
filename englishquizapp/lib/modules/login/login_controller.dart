import 'package:englishquizapp/data/service/repository.dart';
import 'package:englishquizapp/data/storage/user_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final UserStorage userStorage = Get.put<UserStorage>(UserStorage());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Repository repository = Repository();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  Future<void> onLogin() async {
    final String email = emailController.text;
    final String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Thông báo', 'Vui lòng nhập đầy đủ thông tin');
    } else {
      var user = await repository.loginUser(email, password);
      if (user != null && user.email != null && user.password != null) {
        String username = user.username ??
            'DefaultUsername'; // Provide a default value for username if it is null
        userStorage.saveUser(user.email!, user.password!, username);
        Get.toNamed('/home');
      } else {
        Get.snackbar('Thông báo', 'Thông tin đăng nhập không chính xác');
      }
    }
  }
}
