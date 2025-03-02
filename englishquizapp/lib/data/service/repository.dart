import 'package:englishquizapp/data/models/question.dart';
import 'package:englishquizapp/data/models/user.dart';
import 'package:englishquizapp/data/network/api/api_url.dart';
import 'package:englishquizapp/data/network/api/dio_client.dart';
import 'package:englishquizapp/data/storage/records_storage.dart';
import 'package:englishquizapp/data/storage/user_storage.dart';
import 'package:get/get.dart';
import 'package:englishquizapp/data/models/record.dart';

class Repository {
  RecordStorage recordStorage = Get.put(RecordStorage());
  UserStorage userStorage = Get.find<UserStorage>();
  Future<User?> loginUser(String email, String password) async {
    try {
      final response = await Api().post(
        ApiUrl.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 234) {
        final userDetailsResponse = await Api().get('${ApiUrl.getUser}/$email');
        if (userDetailsResponse.statusCode == 234) {
          User user = User.fromJson(userDetailsResponse.data);

          return user;
        }
      }

      return null;
    } catch (e) {
      // Handle errors
      Get.snackbar("Thông báo", "Thông tin đăng nhập không chính xác");
      throw ('Error: $e');
    }
  }

  Future<User> registerUser(
      String username, String email, String password) async {
    try {
      final response = await Api().post(
        ApiUrl.register,
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 234) {
        if (response.data != null) {
          return User.fromJson(response.data);
        }
      }
      return User();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Question>> getEasyQuestions() async {
    try {
      final response = await Api().get(ApiUrl.getEasyQuestions);
      if (response.statusCode == 234) {
        if (response.data != null) {
          List<dynamic> questionDataList = response.data;
          List<Question> questions =
              questionDataList.map((data) => Question.fromJson(data)).toList();
          return questions;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Question>> getMediumQuestions() async {
    try {
      final response = await Api().get(ApiUrl.getMediumQuestions);
      if (response.statusCode == 234) {
        if (response.data != null) {
          List<dynamic> questionDataList = response.data;
          List<Question> questions =
              questionDataList.map((data) => Question.fromJson(data)).toList();
          return questions;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Question>> getHardQuestions() async {
    try {
      final response = await Api().get(ApiUrl.getHardQuestions);
      if (response.statusCode == 234) {
        if (response.data != null) {
          List<dynamic> questionDataList = response.data;
          List<Question> questions =
              questionDataList.map((data) => Question.fromJson(data)).toList();
          return questions;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> postRecord(
      String email, String score, String difficulty, String datetime) async {
    try {
      final response = await Api().post(
        ApiUrl.postRecord,
        data: {
          'email': email,
          'score': score,
          'difficulty': difficulty,
          'datetime': datetime,
        },
      );

      if (response.statusCode == 234) {
        // Handle successful response if needed
      } else {
        throw Exception('Failed to post record');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<dynamic>> getRecords() async {
    try {
      final recordResponse =
          await Api().get('${ApiUrl.getRecords}/${userStorage.userEmail}');
      if (recordResponse.statusCode == 234) {
        var recordData = recordResponse.data;

        // Ensure the data is a list
        if (recordData is List) {
          List<Record> records =
              recordData.map((data) => Record.fromJson(data)).toList();

          recordStorage.saveRecord(records);
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
