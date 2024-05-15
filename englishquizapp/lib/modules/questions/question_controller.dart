// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:englishquizapp/data/models/question_model.dart';
import 'package:englishquizapp/data/storage/questions_storage.dart';
import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:englishquizapp/modules/review/review_page.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  late List<QuestionModel> questions = <QuestionModel>[].obs;
  RxList<QuestionState> questionStates = <QuestionState>[].obs;
  RxInt currentIndex = 0.obs;
  RxInt score = 0.obs;
  RxBool isCurrentQuestionFlagged = false.obs;

  QuestionStorage questionStorage = QuestionStorage();

  final RxList<String> answersList = <String>[].obs;
  RxMap<RxInt, RxList<String>> shuffledAnswersLists =
      RxMap<RxInt, RxList<String>>();

  void moveToNextQuestion() {
    if (currentIndex.value < questionStorage.questions.length - 1) {
      currentIndex.value++;
      updateCurrentQuestionAnswers();
      updateFlaggedStateForCurrentQuestion();
    } else if (currentIndex.value == questionStorage.questions.length - 1) {
      Get.to(() => ReviewPage());
    }
  }

  void moveToPreviousQuestion() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      updateCurrentQuestionAnswers();
      updateFlaggedStateForCurrentQuestion();
    }
  }

  void updateCurrentQuestionAnswers() {
    updateAnswersList(questionStorage, currentIndex);
  }

  void updateAnswersList(QuestionStorage questionStorage, RxInt questionIndex) {
    var existingShuffledAnswers = shuffledAnswersLists[questionIndex];
    if (existingShuffledAnswers == null) {
      List<String>? potentialNewAnswers =
          questionStorage.getAnswersAtIndex(questionIndex);
      if (potentialNewAnswers != null) {
        List<String> newShuffle = List<String>.from(potentialNewAnswers);
        newShuffle.shuffle();
        shuffledAnswersLists[questionIndex] = RxList<String>.from(newShuffle);
      }
    } else {
      answersList.assignAll(existingShuffledAnswers);
    }
  }

  void saveQuestionState(int questionIndex, int selectedAnswerIndex) {
    final index = questionStates
        .indexWhere((state) => state.questionIndex == questionIndex);
    if (index != -1) {
      questionStates[index] = QuestionState(
        questionIndex: questionIndex,
        selectedAnswerIndex: selectedAnswerIndex,
        isFlagged: questionStates[index].isFlagged, // Preserve flag state
      );
    } else {
      questionStates.add(QuestionState(
        questionIndex: questionIndex,
        selectedAnswerIndex: selectedAnswerIndex,
      ));
    }
  }

  int? getSelectedAnswerIndex(int questionIndex) {
    final state = questionStates.firstWhere(
      (state) => state.questionIndex == questionIndex,
      orElse: () => QuestionState(questionIndex: questionIndex),
    );
    return state.selectedAnswerIndex;
  }

  @override
  void onInit() {
    super.onInit();
    shuffleAndDisplayCurrentQuestionAnswers();
    ever(currentIndex, (_) => shuffleAndDisplayCurrentQuestionAnswers());
    ever(currentIndex, (_) => updateFlaggedStateForCurrentQuestion());
  }

  void selectAnswer(int selectedAnswerIndex) {
    if (currentIndex.value < questionStates.length &&
        currentIndex.value < questionStorage.questions.length) {
      final QuestionState currentQuestionState =
          questionStates[currentIndex.value];
      final newQuestionState = QuestionState(
        questionIndex: currentQuestionState.questionIndex,
        selectedAnswerIndex: selectedAnswerIndex,
        isFlagged: currentQuestionState.isFlagged, // Preserve flag state
      );

      questionStates[currentIndex.value] = newQuestionState;

      String? correctAnswer =
          questionStorage.questions[currentIndex.value]['correct_ans'];

      if (selectedAnswerIndex.toString() == correctAnswer) {
        score.value++;
      }
    }
  }

  void shuffleAndDisplayCurrentQuestionAnswers() {
    updateAnswersList(questionStorage, currentIndex);
    var shuffledAnswers = shuffledAnswersLists[currentIndex];
    if (shuffledAnswers != null) {
      answersList.assignAll(shuffledAnswers);
    }
  }

  void flagQuestion(int questionIndex, bool isFlagged) {
    final index = questionStates
        .indexWhere((state) => state.questionIndex == questionIndex);
    if (index != -1) {
      questionStates[index].isFlagged = isFlagged;
    } else {
      questionStates.add(QuestionState(
        questionIndex: questionIndex,
        isFlagged: isFlagged,
      ));
    }
    updateFlaggedStateForCurrentQuestion();
  }

  void updateFlaggedStateForCurrentQuestion() {
    final state = questionStates.firstWhere(
      (state) => state.questionIndex == currentIndex.value,
      orElse: () => QuestionState(questionIndex: currentIndex.value),
    );
    isCurrentQuestionFlagged.value = state.isFlagged ?? false;
  }
}
