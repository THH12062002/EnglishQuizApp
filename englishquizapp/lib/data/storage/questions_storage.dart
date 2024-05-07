// question_storage.dart

import 'package:englishquizapp/data/models/question_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuestionStorage extends GetxController {
  final box = GetStorage();

  void saveQuestions(List<QuestionModel> questions) {
    List<Map<String, dynamic>> questionMapList = questions
        .map((question) => {
              'ans1': question.ans1,
              'ans2': question.ans2,
              'ans3': question.ans3,
              'ans4': question.ans4,
              'point': question.point,
              'content': question.content,
              'difficulty': question.difficulty,
            })
        .toList();

    // Lưu danh sách các câu hỏi vào storage
    box.write('questions', questionMapList);
  }

  // Phương thức để lấy danh sách các câu hỏi từ storage
  List<Map<String, dynamic>> get questions =>
      box.read<List<Map<String, dynamic>>>('questions') ?? [];

  // Phương thức để lấy giá trị của một trường dữ liệu cụ thể từ một câu hỏi ở vị trí index trong danh sách
  String? getAns1AtIndex(int index) => questions[index]['ans1'];
  String? getAns2AtIndex(int index) => questions[index]['ans2'];
  String? getAns3AtIndex(int index) => questions[index]['ans3'];
  String? getAns4AtIndex(int index) => questions[index]['ans4'];
  String? getPointAtIndex(int index) => questions[index]['point'];
  String? getContentAtIndex(int index) => questions[index]['content'];
  String? getDifficultyAtIndex(int index) => questions[index]['difficulty'];
}
