// To parse this JSON data, do
//
//     final medicineModel = medicineModelFromJson(jsonString);

import 'dart:convert';

MedicineModel medicineModelFromJson(String str) => MedicineModel.fromJson(json.decode(str));

String medicineModelToJson(MedicineModel data) => json.encode(data.toJson());

class MedicineModel {
  String? id;
  String? medicineName;
  DateTime? timeTaken;
  String? mealTime;
  String? picture;

  MedicineModel({
    this.id,
    this.medicineName,
    this.timeTaken,
    this.mealTime,
    this.picture,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
    id: json["id"],
    medicineName: json["MedicineName"],
    timeTaken: json["TimeTaken"] == null ? null : DateTime.parse(json["TimeTaken"]),
    mealTime: json["MealTime"],
    picture: json["Picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "MedicineName": medicineName,
    "TimeTaken": timeTaken?.toIso8601String(),
    "MealTime": mealTime,
    "Picture": picture,
  };
}
