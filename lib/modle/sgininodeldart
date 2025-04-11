

import 'dart:convert';

Sgininmoudel sgininmoudelFromJson(String str) => Sgininmoudel.fromJson(json.decode(str));

String sgininmoudelToJson(Sgininmoudel data) => json.encode(data.toJson());

class Sgininmoudel {
    final String message;
    final String arMessage;
    final User user;

    Sgininmoudel({
        required this.message,
        required this.arMessage,
        required this.user,
    });

    factory Sgininmoudel.fromJson(Map<String, dynamic> json) => Sgininmoudel(
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
