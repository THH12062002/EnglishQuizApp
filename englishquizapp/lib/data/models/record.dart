class Record {
  String? email;
  String? score; // Thay đổi từ String sang int
  String? difficulty;
  String? datetime;

  Record({this.email, this.score, this.difficulty, this.datetime});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      email: json['email'],
      score: json['score'], // Không cần chuyển đổi nếu API trả về int
      difficulty: json['difficulty'],
      datetime: json['datetime'],
    );
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
