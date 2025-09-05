import 'dart:convert';

// To parse this JSON data, do
// final specifics = specificsFromJson(jsonString);

Specifics specificsFromJson(String str) => Specifics.fromJson(json.decode(str));

String specificsToJson(Specifics data) => json.encode(data.toJson());

class Specifics {
  final List<Specific> specifics;
  final int totalCount;
  final int documentCount;

  Specifics({
    required this.specifics,
    required this.totalCount,
    required this.documentCount,
  });

  factory Specifics.fromJson(Map<String, dynamic> json) => Specifics(
        specifics: json["specifics"] != null
            ? List<Specific>.from(
                json["specifics"].map((x) => Specific.fromJson(x)))
            : [],
        totalCount: json["totalCount"] ?? 0,
        documentCount: json["documentCount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "specifics": List<dynamic>.from(specifics.map((x) => x.toJson())),
        "totalCount": totalCount,
        "documentCount": documentCount,
      };
}

class Specific {
  final String id;
  final String name;
  final bool isAvailable;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;
  final String? specificId;

  Specific({
    required this.id,
    required this.name,
    required this.isAvailable,
    this.image,
    this.createdAt,
    this.updatedAt,
    required this.v,
    this.specificId,
  });

  factory Specific.fromJson(Map<String, dynamic> json) => Specific(
        id: json["_id"] ?? '',
        name: json["name"] ?? '',
        isAvailable: json["isAvailable"] ?? false,
        image: json["image"] ?? '',
        createdAt: json["createdAt"] != null
            ? DateTime.tryParse(json["createdAt"])
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.tryParse(json["updatedAt"])
            : null,
        v: json["__v"] ?? 0,
        specificId: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "isAvailable": isAvailable,
        "image": image,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": specificId,
      };
}
