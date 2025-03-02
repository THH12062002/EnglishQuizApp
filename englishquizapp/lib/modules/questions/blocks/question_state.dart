// ignore_for_file: non_constant_identifier_names

class QuestionState {
  int questionIndex;
  int? selectedAnswerIndex;
  bool? isFlagged;

  QuestionState({
    required this.questionIndex,
    this.selectedAnswerIndex,
    this.isFlagged,
  });
}
