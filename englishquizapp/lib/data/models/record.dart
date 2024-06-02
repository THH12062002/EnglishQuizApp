class Record {
  String? email;
  String? score;
  String? difficulty;
  String? datetime;

  Record({this.email, this.score, this.difficulty, this.datetime});

  Record.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    score = json['score'];
    difficulty = json['difficulty'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'score': score,
      'difficulty': difficulty,
      'datetime': datetime,
    };
  }
}
