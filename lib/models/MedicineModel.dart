// To parse this JSON data, do
//
//     final medicineModel = medicineModelFromJson(jsonString);

import 'dart:convert';

MedicineModel medicineModelFromJson(String str) => MedicineModel.fromJson(json.decode(str));

String medicineModelToJson(MedicineModel data) => json.encode(data.toJson());

class MedicineModel {
  String? medicineName;
  String? time;
  String? mealTime;
  String? amount;

  MedicineModel({
    this.medicineName,
    this.time,
    this.mealTime,
    this.amount,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
    medicineName: json["medicineName"],
    time: json["time"],
    mealTime: json["mealTime"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "medicineName": medicineName,
    "time": time,
    "mealTime": mealTime,
    "amount": amount,
  };
}
