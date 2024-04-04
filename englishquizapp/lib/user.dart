import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username;
  num password;

  User({
    required this.password,
    required this.username,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          password: json['password']! as num,
          username: json['username']! as String,
        );

  User copyWith({
    num? password,
    String? username,
  }) {
    return User(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory User.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return User(
      username: data['username'] ?? '',
      password: data['password'] ?? '',
    );
  }
}
