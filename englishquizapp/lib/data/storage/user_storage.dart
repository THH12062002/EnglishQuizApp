import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserStorage extends GetxController {
  final box = GetStorage();

  void saveUser(String email, String password, String username) {
    box.write('username', username);
    box.write('email', email);
    box.write('password', password);
  }

  String get username => box.read('username') ?? '';
  String get userEmail => box.read('email') ?? '';
  String get userPassword => box.read('password') ?? '';
}
