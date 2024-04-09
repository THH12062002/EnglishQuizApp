import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishquizapp/data/models/quiz_question.dart';

class Questions {
  String content;
  List<String> answers;
  String difficulty;
  //num point;

  Questions({
    required this.content,
    required this.answers,
    required this.difficulty,
    //required this.point,
  });

  Questions.fromJson(Map<String, dynamic> json)
      : this(
          content: json['content']! as String,
          answers: json['answers']! as List<String>,
          difficulty: json['difficult']! as String,
          //point: json['point']! as num,
        );
  Map<String, dynamic> toJson() => {
        'content': content,
        'answers': answers,
        'difficult': difficulty,
        //'point': point,
      };

  factory Questions.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Questions(
      content: data['content'] ?? '',
      answers: data['answers'] ?? [],
      difficulty: data['difficult'] ?? '',
      //point: data['point'] ?? 0,
    );
  }
}
