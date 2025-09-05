// To parse this JSON data, do
//
//     final getDoctor = getDoctorFromJson(jsonString);

import 'dart:convert';

GetDoctor getDoctorFromJson(String str) => GetDoctor.fromJson(json.decode(str));

String getDoctorToJson(GetDoctor data) => json.encode(data.toJson());

class GetDoctor {
  final List<User> users;
  final int totalCount;
  final int documentCount;

  GetDoctor({
    required this.users,
    required this.totalCount,
    required this.documentCount,
  });

  factory GetDoctor.fromJson(Map<String, dynamic> json) => GetDoctor(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        totalCount: json["totalCount"],
        documentCount: json["documentCount"],
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "totalCount": totalCount,
        "documentCount": documentCount,
      };
}

class User {
  final String id;
  final String? image;
  final String username;
  final String email;
  final String phoneNumber;
  final String birthday;
  final bool isActive;
  final String? fcmToken;
  final String specific;
  final int pricePerHour;
  final List<String> services;
  final String gender;
  final int money;
  final int heartRate;
  final int calories;
  final int weight;
  final String blood;
  final String role;
  final List<dynamic> cart;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String userId;
  final String? address;

  User({
    required this.id,
    required this.image,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.birthday,
    required this.isActive,
    this.fcmToken,
    required this.specific,
    required this.pricePerHour,
    required this.services,
    required this.gender,
    required this.money,
    required this.heartRate,
    required this.calories,
    required this.weight,
    required this.blood,
    required this.role,
    required this.cart,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.userId,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        image: json["image"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        birthday: json["birthday"],
        isActive: json["isActive"],
        fcmToken: json["fcmToken"],
        specific: json["specific"],
        pricePerHour: json["pricePerHour"],
        services: List<String>.from(json["services"].map((x) => x)),
        gender: json["gender"],
        money: json["money"],
        heartRate: json["heartRate"],
        calories: json["calories"],
        weight: json["weight"],
        blood: json["blood"],
        role: json["role"],
        cart: List<dynamic>.from(json["cart"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        userId: json["id"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "birthday": birthday,
        "isActive": isActive,
        "fcmToken": fcmToken,
        "specific": specific,
        "pricePerHour": pricePerHour,
        "services": List<dynamic>.from(services.map((x) => x)),
        "gender": gender,
        "money": money,
        "heartRate": heartRate,
        "calories": calories,
        "weight": weight,
        "blood": blood,
        "role": role,
        "cart": List<dynamic>.from(cart.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": userId,
        "address": address,
      };
}
