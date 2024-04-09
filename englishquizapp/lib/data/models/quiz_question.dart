class QuizQuestion {
  const QuizQuestion(this.content, this.answers);

  final String content;

  final List<String> answers;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      json['content'] as String,
      List<String>.from(json['answers'] as List<dynamic>),
    );
  }
}
