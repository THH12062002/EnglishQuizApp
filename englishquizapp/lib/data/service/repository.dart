import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:englishquizapp/data/models/user.dart';
import 'package:englishquizapp/data/network/api/api_url.dart';
import 'package:englishquizapp/data/network/api/dio_client.dart';

class LoginRepository {
  Future<User?> loginUser(
    String username,
    String password,
  ) async {
    try {
      final response = await Api().post(
        ApiUrl.login,
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 234) {
        return User.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
