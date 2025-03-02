// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals, non_constant_identifier_names

class Question {
  String? ans2;
  String? ans1;
  String? point;
  String? ans3;
  String? content;
  String? ans4;
  String? difficulty;
  String? correct_ans;

  Question(
      {this.ans2,
      this.ans1,
      this.point,
      this.ans3,
      this.content,
      this.ans4,
      this.difficulty,
      this.correct_ans});

  Question.fromJson(Map<String, dynamic> json) {
    ans2 = json['ans2'];
    ans1 = json['ans1'];
    point = json['point'];
    ans3 = json['ans3'];
    content = json['content'];
    ans4 = json['ans4'];
    difficulty = json['difficulty'];
    correct_ans = json['correct_ans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ans2'] = this.ans2;
    data['ans1'] = this.ans1;
    data['point'] = this.point;
    data['ans3'] = this.ans3;
    data['content'] = this.content;
    data['ans4'] = this.ans4;
    data['difficulty'] = this.difficulty;
    data['correct_ans'] = this.correct_ans;
    return data;
  }
}
