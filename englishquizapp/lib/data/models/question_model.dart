// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class QuestionModel {
  String? ans2;
  String? ans1;
  String? point;
  String? ans3;
  String? content;
  String? ans4;
  String? difficulty;

  QuestionModel(
      {this.ans2,
      this.ans1,
      this.point,
      this.ans3,
      this.content,
      this.ans4,
      this.difficulty});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    ans2 = json['ans2'];
    ans1 = json['ans1'];
    point = json['point'];
    ans3 = json['ans3'];
    content = json['content'];
    ans4 = json['ans4'];
    difficulty = json['difficulty'];
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
    return data;
  }
}
