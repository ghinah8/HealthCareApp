// To parse this JSON data, do
//
//     final treatmentModel = treatmentModelFromJson(jsonString);

import 'dart:convert';

TreatmentModel treatmentModelFromJson(String str) =>
    TreatmentModel.fromJson(json.decode(str));

String treatmentModelToJson(TreatmentModel data) => json.encode(data.toJson());

class TreatmentModel {
  final String treatment;
  final String chatId;

  TreatmentModel({
    required this.treatment,
    required this.chatId,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) => TreatmentModel(
        treatment: json["treatment"],
        chatId: json["chatId"],
      );

  Map<String, dynamic> toJson() => {
        "treatment": treatment,
        "chatId": chatId,
      };
}
