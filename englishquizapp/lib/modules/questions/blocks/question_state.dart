class QuestionState {
  final int questionIndex;
  final int? selectedAnswerIndex;
  final int correctAnswerIndex;
  final bool isFlagged; // Chức năng đánh dấu

  QuestionState({
    required this.questionIndex,
    required this.selectedAnswerIndex,
    required this.correctAnswerIndex,
    this.isFlagged = false, // Khởi tạo mặc định là không đánh dấu
  });
}
