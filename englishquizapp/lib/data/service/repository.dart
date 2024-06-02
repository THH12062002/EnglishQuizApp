import 'package:englishquizapp/data/models/question_model.dart';
import 'package:englishquizapp/data/models/user.dart';
import 'package:englishquizapp/data/network/api/api_url.dart';
import 'package:englishquizapp/data/network/api/dio_client.dart';
import 'package:englishquizapp/data/storage/records_storage.dart';
import 'package:englishquizapp/data/models/record.dart';
import 'package:get/get.dart';

class Repository {
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

          // Fetch and save records
          final recordResponse = await Api().get('${ApiUrl.getRecords}/$email');
          if (recordResponse.statusCode == 234) {
            List<dynamic> recordDataList = recordResponse.data;
            List<Record> records =
                recordDataList.map((data) => Record.fromJson(data)).toList();

            RecordStorage recordStorage = Get.put(RecordStorage());
            recordStorage.saveRecord(records);
          }
          return user;
        }
      }

      return null;
    } catch (e) {
      Get.snackbar("Thông báo", "Thông tin đăng nhập không chính xác");
      return null;
    }
  }

  // Future<User?> loginUser(String email, String password) async {
  //   try {
  //     final response = await Api().post(
  //       ApiUrl.login,
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );

  //     if (response.statusCode == 234) {
  //       final userDetailsResponse = await Api().get('${ApiUrl.getUser}/$email');
  //       if (userDetailsResponse.statusCode == 234) {
  //         final user = User.fromJson(userDetailsResponse.data);

  //         final recordResponse = await Api().get('${ApiUrl.getRecords}/$email');
  //         if (recordResponse.statusCode == 234) {
  //           final record = Record.fromJson(recordResponse.data);

  //           RecordStorage recordStorage =
  //               Get.put<RecordStorage>(RecordStorage());
  //           recordStorage.saveRecord(
  //             record.email ?? '',
  //             record.score ?? '',
  //             record.difficulty ?? '',
  //             record.datetime ?? '',
  //           );
  //         }

  //         return user;
  //       }
  //     }

  //     return null; // Return null if login or user details fetch fails
  //   } catch (e) {
  //     Get.snackbar("Thông báo", "Thông tin đăng nhập không chính xác");
  //     return null;
  //   }
  // }

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

  Future<List<QuestionModel>> getEasyQuestions() async {
    try {
      final response = await Api().get(ApiUrl.getEasyQuestions);
      if (response.statusCode == 234) {
        if (response.data != null) {
          List<dynamic> questionDataList = response.data;
          List<QuestionModel> questions = questionDataList
              .map((data) => QuestionModel.fromJson(data))
              .toList();
          return questions;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<QuestionModel>> getMediumQuestions() async {
    try {
      final response = await Api().get(ApiUrl.getMediumQuestions);
      if (response.statusCode == 234) {
        if (response.data != null) {
          List<dynamic> questionDataList = response.data;
          List<QuestionModel> questions = questionDataList
              .map((data) => QuestionModel.fromJson(data))
              .toList();
          return questions;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<QuestionModel>> getHardQuestions() async {
    try {
      final response = await Api().get(ApiUrl.getHardQuestions);
      if (response.statusCode == 234) {
        if (response.data != null) {
          List<dynamic> questionDataList = response.data;
          List<QuestionModel> questions = questionDataList
              .map((data) => QuestionModel.fromJson(data))
              .toList();
          return questions;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
