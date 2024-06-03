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

  //
}
