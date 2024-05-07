// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/data/service/repository.dart';
import 'package:englishquizapp/data/storage/questions_storage.dart';
import 'package:englishquizapp/modules/questions/question_page.dart';
import 'package:get/get.dart';

class ChooseLvController extends GetxController {
  Repository repository = Repository();
  final QuestionStorage questionStorage =
      Get.put<QuestionStorage>(QuestionStorage());

  Future<void> onLvEasy() async {
    var questions = await repository.getEasyQuestions();
    if (questions.isNotEmpty) {
      for (var question in questions) {
        questionStorage.saveQuestion(
          ans1: question.ans1,
          ans2: question.ans2,
          ans3: question.ans3,
          ans4: question.ans4,
          point: question.point,
          content: question.content,
          difficulty: question.difficulty,
          currentIndex: questions.indexOf(question),
        );
        Get.to(QuestionPage());
      }
    } else {
      Get.snackbar('Thông báo', 'Không có câu hỏi ở mức độ dễ');
    }
  }

  Future<void> onLvMedium() async {
    var questions = await repository.getMediumQuestions();
    if (questions.isNotEmpty) {
      for (var question in questions) {
        questionStorage.saveQuestion(
          ans1: question.ans1,
          ans2: question.ans2,
          ans3: question.ans3,
          ans4: question.ans4,
          point: question.point,
          content: question.content,
          difficulty: question.difficulty,
          currentIndex: questions.indexOf(question),
        );
        Get.to(QuestionPage());
      }
    } else {
      Get.snackbar('Thông báo', 'Không có câu hỏi ở mức độ trung bình');
    }
  }

  Future<void> onLvHard() async {
    var questions = await repository.getHardQuestions();
    if (questions.isNotEmpty) {
      for (var question in questions) {
        questionStorage.saveQuestion(
          ans1: question.ans1,
          ans2: question.ans2,
          ans3: question.ans3,
          ans4: question.ans4,
          point: question.point,
          content: question.content,
          difficulty: question.difficulty,
          currentIndex: questions.indexOf(question),
        );
        Get.to(QuestionPage());
      }
    } else {
      Get.snackbar('Thông báo', 'Không có câu hỏi ở mức độ khó');
    }
  }
}
