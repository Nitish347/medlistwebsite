// To parse this JSON data, do
//
//     final medicineModel = medicineModelFromJson(jsonString);

import 'dart:convert';

MedicineModel medicineModelFromJson(String str) => MedicineModel.fromJson(json.decode(str));

String medicineModelToJson(MedicineModel data) => json.encode(data.toJson());

class MedicineModel {
  String? patientId;
  String? medicineName;
  String? picture;
  String? timeTaken;

  MedicineModel({
    this.patientId,
    this.medicineName,
    this.picture,
    this.timeTaken,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
    patientId: json["PatientID"],
    medicineName: json["MedicineName"],
    picture: json["Picture"],
    timeTaken: json["TimeTaken"],
  );

  Map<String, dynamic> toJson() => {
    "PatientID": patientId,
    "MedicineName": medicineName,
    "Picture": picture,
    "TimeTaken": timeTaken,
  };
}
