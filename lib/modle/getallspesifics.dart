import 'dart:convert';

SpecialtiesModel specialtiesModelFromJson(String str) =>
    SpecialtiesModel.fromJson(json.decode(str));

String specialtiesModelToJson(SpecialtiesModel data) =>
    json.encode(data.toJson());

class SpecialtiesModel {
  final List<Specialty> specifics;
  final int totalCount;
  final int documentCount;

  SpecialtiesModel({
    required this.specifics,
    required this.totalCount,
    required this.documentCount,
  });

  factory SpecialtiesModel.fromJson(Map<String, dynamic> json) =>
      SpecialtiesModel(
        specifics: List<Specialty>.from(
            json["specifics"].map((x) => Specialty.fromJson(x))),
        totalCount: json["totalCount"],
        documentCount: json["documentCount"],
      );

  Map<String, dynamic> toJson() => {
        "specifics": List<dynamic>.from(specifics.map((x) => x.toJson())),
        "totalCount": totalCount,
        "documentCount": documentCount,
      };
}

class Specialty {
  final String id;
  final String name;
  final bool isAvailable;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String specialtyId;

  Specialty({
    required this.id,
    required this.name,
    required this.isAvailable,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.specialtyId,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
        id: json["_id"],
        name: json["name"],
        isAvailable: json["isAvailable"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        specialtyId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "isAvailable": isAvailable,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": specialtyId,
      };
}
