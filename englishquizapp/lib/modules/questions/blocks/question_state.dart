// ignore_for_file: non_constant_identifier_names

class QuestionState {
  int questionIndex;
  int? selectedAnswerIndex;
  bool? isFlagged; // Chức năng đánh dấu

  QuestionState({
    required this.questionIndex,
    this.selectedAnswerIndex,
    this.isFlagged = false, // Khởi tạo mặc định là không đánh dấu
  });
}
