// To parse this JSON data, do
//
//     final getnOneDoctor = getnOneDoctorFromJson(jsonString);

import 'dart:convert';

GetnOneDoctor getnOneDoctorFromJson(String str) =>
    GetnOneDoctor.fromJson(json.decode(str));

String getnOneDoctorToJson(GetnOneDoctor data) => json.encode(data.toJson());

class GetnOneDoctor {
  final String id;
  final String image;
  final String username;
  final String email;
  final String phoneNumber;
  final String birthday;
  final bool isActive;
  final String specific;
  final int pricePerHour;
  final List<dynamic> services;
  final String gender;
  final int money;
  final int heartRate;
  final int calories;
  final int weight;
  final String blood;
  final String address;
  final String role;
  final List<dynamic> cart;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String getnOneDoctorId;

  GetnOneDoctor({
    required this.id,
    required this.image,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.birthday,
    required this.isActive,
    required this.specific,
    required this.pricePerHour,
    required this.services,
    required this.gender,
    required this.money,
    required this.heartRate,
    required this.calories,
    required this.weight,
    required this.blood,
    required this.address,
    required this.role,
    required this.cart,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.getnOneDoctorId,
  });

  factory GetnOneDoctor.fromJson(Map<String, dynamic> json) => GetnOneDoctor(
        id: json["_id"],
        image: json["image"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        birthday: json["birthday"],
        isActive: json["isActive"],
        specific: json["specific"],
        pricePerHour: json["pricePerHour"],
        services: List<dynamic>.from(json["services"].map((x) => x)),
        gender: json["gender"],
        money: json["money"],
        heartRate: json["heartRate"],
        calories: json["calories"],
        weight: json["weight"],
        blood: json["blood"],
        address: json["address"],
        role: json["role"],
        cart: List<dynamic>.from(json["cart"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        getnOneDoctorId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "birthday": birthday,
        "isActive": isActive,
        "specific": specific,
        "pricePerHour": pricePerHour,
        "services": List<dynamic>.from(services.map((x) => x)),
        "gender": gender,
        "money": money,
        "heartRate": heartRate,
        "calories": calories,
        "weight": weight,
        "blood": blood,
        "address": address,
        "role": role,
        "cart": List<dynamic>.from(cart.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": getnOneDoctorId,
      };
}
