import 'package:englishquizapp/data/storage/questions_storage.dart';
import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:englishquizapp/modules/review/review_page.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  late RxList<Map<String, dynamic>> questions;
  RxList<QuestionState> questionStates = <QuestionState>[].obs;
  RxInt currentIndex = 0.obs;
  RxInt score = 0.obs;
  RxBool isCurrentQuestionFlagged = false.obs;
  QuestionStorage questionStorage = Get.find<QuestionStorage>();
  final RxList<String> answersList = <String>[].obs;
  RxMap<int, RxList<String>> shuffledAnswersLists =
      RxMap<int, RxList<String>>();

  @override
  void onInit() {
    super.onInit();
    loadQuestions(); // Load câu hỏi khi controller được khởi tạo
  }

  void loadQuestions() {
    questions = questionStorage.questions;
    questionStates.clear();
    questionStates.addAll(List.generate(
        questions.length, (index) => QuestionState(questionIndex: index)));
    shuffleAndDisplayCurrentQuestionAnswers();
    ever(currentIndex, (_) => shuffleAndDisplayCurrentQuestionAnswers());
    ever(currentIndex, (_) => updateFlaggedStateForCurrentQuestion());
  }

  void resetQuiz() {
    currentIndex.value = 0;
    score.value = 0;
    isCurrentQuestionFlagged.value = false;
    shuffledAnswersLists.clear();
    loadQuestions();
  }

  void moveToNextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      updateFlaggedStateForCurrentQuestion();
    } else if (currentIndex.value == questions.length - 1) {
      Get.to(() => ReviewPage());
    }
  }

  void moveToPreviousQuestion() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      updateFlaggedStateForCurrentQuestion();
    }
  }

  void saveQuestionState(int questionIndex, int selectedAnswerIndex) {
    final index = questionStates
        .indexWhere((state) => state.questionIndex == questionIndex);
    if (index != -1) {
      questionStates[index] = QuestionState(
        questionIndex: questionIndex,
        selectedAnswerIndex: selectedAnswerIndex,
        isFlagged: questionStates[index].isFlagged,
      );
    } else {
      questionStates.add(QuestionState(
        questionIndex: questionIndex,
        selectedAnswerIndex: selectedAnswerIndex,
      ));
    }
  }

  int? getSelectedAnswerIndex(int questionIndex) {
    if (questionIndex < questionStates.length) {
      final state = questionStates.firstWhere(
        (state) => state.questionIndex == questionIndex,
        orElse: () => QuestionState(questionIndex: questionIndex),
      );
      return state.selectedAnswerIndex;
    }
    return null;
  }

  void selectAnswer(int selectedAnswerIndex) {
    if (currentIndex.value < questions.length) {
      final QuestionState currentQuestionState =
          questionStates[currentIndex.value];
      final newQuestionState = QuestionState(
        questionIndex: currentQuestionState.questionIndex,
        selectedAnswerIndex: selectedAnswerIndex,
        isFlagged: currentQuestionState.isFlagged,
      );

      questionStates[currentIndex.value] = newQuestionState;

      String? correctAnswer =
          questionStorage.getCorrectAnswerAtIndex(RxInt(currentIndex.value));
      List<String>? answers =
          shuffledAnswersLists[currentIndex.value]?.toList();

      if (answers != null && correctAnswer == answers[selectedAnswerIndex]) {
        score.value +=
            100; // Increase score by 100 points for each correct answer
      }
    }
  }

  void shuffleAndDisplayCurrentQuestionAnswers() {
    updateAnswersList(currentIndex);
    var shuffledAnswers = shuffledAnswersLists[currentIndex.value];
    if (shuffledAnswers != null) {
      answersList.assignAll(shuffledAnswers);
    }
  }

  void updateAnswersList(RxInt questionIndex) {
    var existingShuffledAnswers = shuffledAnswersLists[questionIndex.value];
    if (existingShuffledAnswers == null) {
      List<String>? potentialNewAnswers =
          questionStorage.getAnswersAtIndex(questionIndex);
      if (potentialNewAnswers != null) {
        List<String> newShuffle = List<String>.from(potentialNewAnswers);
        newShuffle.shuffle();
        shuffledAnswersLists[questionIndex.value] =
            RxList<String>.from(newShuffle);
      }
    } else {
      answersList.assignAll(existingShuffledAnswers);
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

  String getQuestionContent(int index) {
    return questionStorage.getContentAtIndex(RxInt(index)) ?? '';
  }

  String? getSelectedAnswer(int questionIndex) {
    int? selectedAnswerIndex = getSelectedAnswerIndex(questionIndex);
    if (selectedAnswerIndex == null || selectedAnswerIndex == -1) return null;
    List<String>? answers = shuffledAnswersLists[questionIndex]?.toList();
    return answers?[selectedAnswerIndex];
  }

  String getCorrectAnswer(int questionIndex) {
    return questionStorage.getCorrectAnswerAtIndex(RxInt(questionIndex)) ?? '';
  }

  // Add method to get the total number of questions
  int getTotalQuestions() {
    return questions.length;
  }
}
