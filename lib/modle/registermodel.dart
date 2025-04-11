import 'dart:convert';

String registermoudelToJson(Registermoudel data) => json.encode(data.toJson());

class Registermoudel {
  final String message;
  final String arMessage;
  final User user;

  Registermoudel({
    required this.message,
    required this.arMessage,
    required this.user,
  });

  factory Registermoudel.fromJson(Map<String, dynamic> json) => Registermoudel(
        message: json["message"],
        arMessage: json["arMessage"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "arMessage": arMessage,
        "user": user.toJson(),
      };
}

class User {
  final String id;
  final String role;
  final String token;
  final String username;

  User({
    required this.id,
    required this.role,
    required this.token,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        role: json["role"],
        token: json["token"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "role": role,
        "token": token,
        "username": username,
      };
}
