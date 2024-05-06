import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserStorage extends GetxController {
  final box = GetStorage();

  void saveUser(String email, String password) {
    box.write('email', email);
    box.write('password', password);
  }

  String get userEmail => box.read('email') ?? '';
  String get userPassword => box.read('password') ?? '';
}
