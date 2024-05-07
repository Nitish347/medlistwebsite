// To parse this JSON data, do
//
//     final medicineGetModel = medicineGetModelFromJson(jsonString);

import 'dart:convert';

MedicineGetModel medicineGetModelFromJson(String str) => MedicineGetModel.fromJson(json.decode(str));

String medicineGetModelToJson(MedicineGetModel data) => json.encode(data.toJson());

class MedicineGetModel {
  String? medicineName;
  DateTime? timeTaken;
  String? mealTime;
  String? picture;
  DateTime? dateAdded;
  String? id;

  MedicineGetModel({
    this.medicineName,
    this.timeTaken,
    this.mealTime,
    this.picture,
    this.dateAdded,
    this.id,
  });

  factory MedicineGetModel.fromJson(Map<String, dynamic> json) => MedicineGetModel(
    medicineName: json["MedicineName"],
    timeTaken: json["TimeTaken"] == null ? null : DateTime.parse(json["TimeTaken"]),
    mealTime: json["MealTime"],
    picture: json["Picture"],
    dateAdded: json["DateAdded"] == null ? null : DateTime.parse(json["DateAdded"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "MedicineName": medicineName,
    "TimeTaken": timeTaken?.toIso8601String(),
    "MealTime": mealTime,
    "Picture": picture,
    "DateAdded": dateAdded?.toIso8601String(),
    "_id": id,
  };
}
