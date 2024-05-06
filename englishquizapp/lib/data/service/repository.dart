import 'package:englishquizapp/data/models/question_model.dart';
import 'package:englishquizapp/data/models/user.dart';
import 'package:englishquizapp/data/network/api/api_url.dart';
import 'package:englishquizapp/data/network/api/dio_client.dart';

class Repository {
  Future<User> loginUser(String email, String password) async {
    try {
      final response = await Api().post(
        ApiUrl.login,
        data: {
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

  Future<User> registerUser(String email, String password) async {
    try {
      final response = await Api().post(
        ApiUrl.register,
        data: {
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
