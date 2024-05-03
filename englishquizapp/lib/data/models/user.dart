// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class User {
  String? username;
  String? password;

  User({this.username, this.password});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
