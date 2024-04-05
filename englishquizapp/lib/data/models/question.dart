import 'package:cloud_firestore/cloud_firestore.dart';

class Questions {
  String content;
  String ans1;
  String ans2;
  String ans3;
  String ans4;
  String difficult;
  num point;

  Questions({
    required this.content,
    required this.ans1,
    required this.ans2,
    required this.ans3,
    required this.ans4,
    required this.difficult,
    required this.point,
  });

  Questions.fromJson(Map<String, dynamic> json)
      : this(
          content: json['content']! as String,
          ans1: json['ans1']! as String,
          ans2: json['ans2']! as String,
          ans3: json['ans3']! as String,
          ans4: json['ans4']! as String,
          difficult: json['difficult']! as String,
          point: json['point']! as num,
        );
  Map<String, dynamic> toJson() => {
        'content': content,
        'ans1': ans1,
        'ans2': ans2,
        'ans3': ans3,
        'ans4': ans4,
        'difficult': difficult,
        'point': point,
      };

  factory Questions.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Questions(
      content: data['content'] ?? '',
      ans1: data['ans1'] ?? '',
      ans2: data['ans2'] ?? '',
      ans3: data['ans3'] ?? '',
      ans4: data['ans4'] ?? '',
      difficult: data['difficult'] ?? '',
      point: data['point'] ?? 0,
    );
  }
}
