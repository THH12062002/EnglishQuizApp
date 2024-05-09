// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/data/models/question_model.dart';
import 'package:englishquizapp/data/storage/questions_storage.dart';
import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:englishquizapp/modules/review/review_page.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  late List<QuestionModel> questions;
  late List<QuestionState> questionStates;
  late int? initialIndex;
  RxInt currentIndex = 0.obs;
  RxInt score = 0.obs;
  late List<List<int>> selectedAnswerIndices;
  late List<bool> questionFlags;
  QuestionStorage questionStorage = QuestionStorage();
  late List<int> flaggedQuestions = [];
  RxInt selectedAnswerIndex = RxInt(0);
  final RxList<String> answersList = <String>[].obs;
  void moveToNextQuestion() {
    if (currentIndex < questionStorage.questions.length - 1) {
      currentIndex++;
    } else if (currentIndex == questionStorage.questions.length - 1) {
      // } else {
      //   for (int i = 0; i < questionStorage.questions.length; i++) {
      //     questionStates?[i] = QuestionState(
      //       questionIndex: i,
      //       selectedAnswerIndex: selectedAnswerIndices[i].isNotEmpty
      //           ? selectedAnswerIndices[i][0]
      //           : null,
      //       correctAnswerIndex: 0,
      //     );
      //   }
      Get.to(() => ReviewPage());
    }
  }

  void moveToPreviousQuestion() {
    if (currentIndex > 0) {
      currentIndex--;
    }
  }

  void updateAnswersList(QuestionStorage questionStorage, RxInt questionIndex) {
    answersList.clear();
    answersList.add(questionStorage.getAns1AtIndex(questionIndex)!);
    answersList.add(questionStorage.getAns2AtIndex(questionIndex)!);
    answersList.add(questionStorage.getAns3AtIndex(questionIndex)!);
    answersList.add(questionStorage.getAns4AtIndex(questionIndex)!);
    answersList.shuffle();
  }

  // void flagQuestion() {
  //   questionFlags[currentIndex] = !questionFlags[currentIndex];
  //   if (questionFlags[currentIndex]) {
  //     flaggedQuestions.add(currentIndex);
  //   } else {
  //     flaggedQuestions.remove(currentIndex);
  //   }
  // }

  // void selectAnswer(int answerIndex) {
  //   selectedAnswerIndices[currentIndex] = [answerIndex];
  //   if (answerIndex == questions[currentIndex].correctAnswerIndex) {
  //     score.value++;
  //   }
  // }

  void incrementScore() {
    score += 100;
  }

  // void _saveQuestionState(int selectedIndex) {
  //   int correctAnswerIndex = 0; // Giả sử đáp án đúng luôn ở index 0
  //   // Lưu trạng thái của câu hỏi và câu trả lời đã chọn
  //   widget.onQuestionStateChanged(QuestionState(
  //     questionIndex: widget.questionIndex,
  //     selectedAnswerIndex: selectedIndex,
  //     correctAnswerIndex: correctAnswerIndex,
  //   ));
  // }

  // @override
  // void didUpdateWidget(covariant AnswerBlock oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   // Update selectedAnswerIndex when the widget is updated
  //   if (widget.questionIndex < widget.questionStates.length) {
  //     selectedAnswerIndex =
  //         widget.questionStates[widget.questionIndex].selectedAnswerIndex;
  //   } else {
  //     selectedAnswerIndex = null;
  //   }
  // }

  // @override
  // void initState() {
  //   //super.initState();
  //   currentIndex = initialIndex ?? 0;
  //   selectedAnswerIndices = List.generate(questions.length, (_) => []);
  //   questionFlags = List.generate(questions.length, (_) => false);
  //   questionStates = questionStates ??
  //       List.generate(questions.length, (index) {
  //         return QuestionState(
  //           questionIndex: index,
  //           selectedAnswerIndex: -1,
  //           correctAnswerIndex: 0,
  //         );
  //       });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // Set selectedAnswerIndex to the index of the selected answer if it's already selected
  //   if (widget.questionIndex < widget.questionStates.length) {
  //     selectedAnswerIndex =
  //         widget.questionStates[widget.questionIndex].selectedAnswerIndex;
  //   }
  // }
}
