import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

class Questions {
  String content;
  List<String> answers;
  String difficulty;

  Questions({
    required this.content,
    required this.answers,
    required this.difficulty,
  });

  Questions.fromJson(Map<String, dynamic> json)
      : this(
          content: json['content']! as String,
          answers: List<String>.from(json['answers']! as List<dynamic>),
          difficulty: json['difficulty']! as String,
        );

  Map<String, dynamic> toJson() => {
        'content': content,
        'answers': answers,
        'difficulty': difficulty,
      };

  factory Questions.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Questions(
      content: data['content'] ?? '',
      answers: List<String>.from(data['answers'] ?? []),
      difficulty: data['difficulty'] ?? '',
    );
  }
}

// class QuestionState {
//   final int questionIndex;
//   final int? selectedAnswerIndex;

//   QuestionState({required this.questionIndex, this.selectedAnswerIndex});
// }
