// question_storage.dart

import 'package:englishquizapp/data/models/question_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuestionStorage extends GetxController {
  final box = GetStorage();

  void saveQuestions(List<QuestionModel> questions) {
    List<Map<String, dynamic>> questionMapList = questions
        .map((question) => {
              'answers': [
                question.ans1,
                question.ans2,
                question.ans3,
                question.ans4,
              ],
              'point': question.point,
              'content': question.content,
              'difficulty': question.difficulty,
              'correct_ans': question.correct_ans,
            })
        .toList();

    // Lưu danh sách các câu hỏi vào storage
    box.write('questions', questionMapList);
  }

  // Phương thức để lấy danh sách các câu hỏi từ storage
  RxList<Map<String, dynamic>> get questions {
    final List<Map<String, dynamic>> storedQuestions =
        box.read<List<Map<String, dynamic>>>('questions') ?? [];
    return storedQuestions.obs;
  }

  List<String>? getAnswersAtIndex(RxInt index) =>
      questions[index.value]['answers'].cast<String>();
  String? getPointAtIndex(RxInt index) => questions[index.value]['point'];
  String? getContentAtIndex(RxInt index) => questions[index.value]['content'];
  String? getDifficultyAtIndex(RxInt index) =>
      questions[index.value]['difficulty'];
  String? getCorrectAnswerAtIndex(RxInt index) =>
      questions[index.value]['correct_ans'];
}
