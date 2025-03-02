// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/data/service/repository.dart';
import 'package:englishquizapp/data/storage/questions_storage.dart';
import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:englishquizapp/modules/questions/question_page.dart';
import 'package:get/get.dart';

class ChooseLvController extends GetxController {
  Repository repository = Repository();
  final QuestionStorage questionStorage =
      Get.put<QuestionStorage>(QuestionStorage());
  final QuestionController questionController =
      Get.put<QuestionController>(QuestionController());

  Future<void> onLvEasy() async {
    var questions = await repository.getEasyQuestions();
    if (questions.isNotEmpty) {
      questionStorage
          .saveQuestions(questions); // Lưu tất cả câu hỏi vào storage
      questionController.resetQuiz(); // Reset lại quiz với câu hỏi mới
      Get.to(() => QuestionPage());
    } else {
      Get.snackbar('Thông báo', 'Không có câu hỏi ở mức độ dễ');
    }
  }

  Future<void> onLvMedium() async {
    var questions = await repository.getMediumQuestions();
    if (questions.isNotEmpty) {
      questionStorage
          .saveQuestions(questions); // Lưu tất cả câu hỏi vào storage
      questionController.resetQuiz(); // Reset lại quiz với câu hỏi mới
      Get.to(() => QuestionPage());
    } else {
      Get.snackbar('Thông báo', 'Không có câu hỏi ở mức độ trung bình');
    }
  }

  Future<void> onLvHard() async {
    var questions = await repository.getHardQuestions();
    if (questions.isNotEmpty) {
      questionStorage
          .saveQuestions(questions); // Lưu tất cả câu hỏi vào storage
      questionController.resetQuiz(); // Reset lại quiz với câu hỏi mới
      Get.to(() => QuestionPage());
    } else {
      Get.snackbar('Thông báo', 'Không có câu hỏi ở mức độ khó');
    }
  }
}
