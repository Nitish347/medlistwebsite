// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

List<AppointmentModel> appointmentModelFromJson(String str) => List<AppointmentModel>.from(json.decode(str).map((x) => AppointmentModel.fromJson(x)));

String appointmentModelToJson(List<AppointmentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentModel {
  String? id;
  String? patientName;
  int? age;
  String? gender;
  List<Hospital>? hospital;
  String? phone;
  List<Medicine>? medicine;
  List<Medicine>? prevMedicine;
  List<dynamic>? exercise;
  BalancedDiet? balancedDiet;
  List<Appointment>? appointment;

  AppointmentModel({
    this.id,
    this.patientName,
    this.age,
    this.gender,
    this.hospital,
    this.phone,
    this.medicine,
    this.prevMedicine,
    this.exercise,
    this.balancedDiet,
    this.appointment,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
    id: json["_id"],
    patientName: json["PatientName"],
    age: json["Age"],
    gender: json["Gender"],
    hospital: json["Hospital"] == null ? [] : List<Hospital>.from(json["Hospital"]!.map((x) => Hospital.fromJson(x))),
    phone: json["Phone"],
    medicine: json["Medicine"] == null ? [] : List<Medicine>.from(json["Medicine"]!.map((x) => Medicine.fromJson(x))),
    prevMedicine: json["PrevMedicine"] == null ? [] : List<Medicine>.from(json["PrevMedicine"]!.map((x) => Medicine.fromJson(x))),
    exercise: json["Exercise"] == null ? [] : List<dynamic>.from(json["Exercise"]!.map((x) => x)),
    balancedDiet: json["BalancedDiet"] == null ? null : BalancedDiet.fromJson(json["BalancedDiet"]),
    appointment: json["Appointment"] == null ? [] : List<Appointment>.from(json["Appointment"]!.map((x) => Appointment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "PatientName": patientName,
    "Age": age,
    "Gender": gender,
    "Hospital": hospital == null ? [] : List<dynamic>.from(hospital!.map((x) => x.toJson())),
    "Phone": phone,
    "Medicine": medicine == null ? [] : List<dynamic>.from(medicine!.map((x) => x.toJson())),
    "PrevMedicine": prevMedicine == null ? [] : List<dynamic>.from(prevMedicine!.map((x) => x.toJson())),
    "Exercise": exercise == null ? [] : List<dynamic>.from(exercise!.map((x) => x)),
    "BalancedDiet": balancedDiet?.toJson(),
    "Appointment": appointment == null ? [] : List<dynamic>.from(appointment!.map((x) => x.toJson())),
  };
}

class Appointment {
  String? hospitalId;
  String? date;
  String? slot;
  String? status;
  String? id;

  Appointment({
    this.hospitalId,
    this.date,
    this.slot,
    this.status,
    this.id,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    hospitalId: json["HospitalID"],
    date: json["Date"],
    slot: json["slot"],
    status: json["status"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "HospitalID": hospitalId,
    "Date": date,
    "slot": slot,
    "status": status,
    "_id": id,
  };
}

class BalancedDiet {
  List<dynamic>? whatToEat;
  List<dynamic>? whatNotToEat;

  BalancedDiet({
    this.whatToEat,
    this.whatNotToEat,
  });

  factory BalancedDiet.fromJson(Map<String, dynamic> json) => BalancedDiet(
    whatToEat: json["WhatToEat"] == null ? [] : List<dynamic>.from(json["WhatToEat"]!.map((x) => x)),
    whatNotToEat: json["WhatNotToEat"] == null ? [] : List<dynamic>.from(json["WhatNotToEat"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "WhatToEat": whatToEat == null ? [] : List<dynamic>.from(whatToEat!.map((x) => x)),
    "WhatNotToEat": whatNotToEat == null ? [] : List<dynamic>.from(whatNotToEat!.map((x) => x)),
  };
}

class Hospital {
  String? hospitalId;
  String? hospitalName;
  String? address;
  String? doctorName;
  String? verified;
  String? id;

  Hospital({
    this.hospitalId,
    this.hospitalName,
    this.address,
    this.doctorName,
    this.verified,
    this.id,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
    hospitalId: json["HospitalID"],
    hospitalName: json["HospitalName"],
    address: json["Address"],
    doctorName: json["DoctorName"],
    verified: json["Verified"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "HospitalID": hospitalId,
    "HospitalName": hospitalName,
    "Address": address,
    "DoctorName": doctorName,
    "Verified": verified,
    "_id": id,
  };
}

class Medicine {
  String? hospitalId;
  String? medicineName;
  DateTime? timeTaken;
  String? mealTime;
  String? picture;
  DateTime? dateAdded;
  String? id;

  Medicine({
    this.hospitalId,
    this.medicineName,
    this.timeTaken,
    this.mealTime,
    this.picture,
    this.dateAdded,
    this.id,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    hospitalId: json["HospitalID"],
    medicineName: json["MedicineName"],
    timeTaken: json["TimeTaken"] == null ? null : DateTime.parse(json["TimeTaken"]),
    mealTime: json["MealTime"],
    picture: json["Picture"],
    dateAdded: json["DateAdded"] == null ? null : DateTime.parse(json["DateAdded"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "HospitalID": hospitalId,
    "MedicineName": medicineName,
    "TimeTaken": timeTaken?.toIso8601String(),
    "MealTime": mealTime,
    "Picture": picture,
    "DateAdded": dateAdded?.toIso8601String(),
    "_id": id,
  };
}
