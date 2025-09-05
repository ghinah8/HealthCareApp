// To parse this JSON data, do
//
//     final getallAmbulance = getallAmbulanceFromJson(jsonString);

import 'dart:convert';

GetallAmbulance getallAmbulanceFromJson(String str) =>
    GetallAmbulance.fromJson(json.decode(str));

String getallAmbulanceToJson(GetallAmbulance data) =>
    json.encode(data.toJson());

class GetallAmbulance {
  final List<Ambulance> ambulances;
  final int totalCount;
  final int documentCount;

  GetallAmbulance({
    required this.ambulances,
    required this.totalCount,
    required this.documentCount,
  });

  factory GetallAmbulance.fromJson(Map<String, dynamic> json) =>
      GetallAmbulance(
        ambulances: List<Ambulance>.from(
            json["ambulances"].map((x) => Ambulance.fromJson(x))),
        totalCount: json["totalCount"],
        documentCount: json["documentCount"],
      );

  Map<String, dynamic> toJson() => {
        "ambulances": List<dynamic>.from(ambulances.map((x) => x.toJson())),
        "totalCount": totalCount,
        "documentCount": documentCount,
      };
}

class Ambulance {
  final String id;
  final String image;
  final String phoneNumber;
  final String name;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Ambulance({
    required this.id,
    required this.image,
    required this.phoneNumber,
    required this.name,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Ambulance.fromJson(Map<String, dynamic> json) => Ambulance(
        id: json["_id"],
        image: json["image"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "phoneNumber": phoneNumber,
        "name": name,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
