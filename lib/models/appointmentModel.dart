// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

AppointmentModel appointmentModelFromJson(String str) => AppointmentModel.fromJson(json.decode(str));

String appointmentModelToJson(AppointmentModel data) => json.encode(data.toJson());

class AppointmentModel {
  BalancedDiet? balancedDiet;
  String? id;
  List<Hospital>? hospital;
  List<Medicine>? medicine;
  List<dynamic>? exercise;
  List<dynamic>? reports;
  List<Token>? tokens;
  String? patientName;
  int? age;
  String? phone;
  int? v;
  String? gender;
  List<Appointment>? appointment;

  AppointmentModel({
    this.balancedDiet,
    this.id,
    this.hospital,
    this.medicine,
    this.exercise,
    this.reports,
    this.tokens,
    this.patientName,
    this.age,
    this.phone,
    this.v,
    this.gender,
    this.appointment,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
    balancedDiet: json["BalancedDiet"] == null ? null : BalancedDiet.fromJson(json["BalancedDiet"]),
    id: json["_id"],
    hospital: json["Hospital"] == null ? [] : List<Hospital>.from(json["Hospital"]!.map((x) => Hospital.fromJson(x))),
    medicine: json["Medicine"] == null ? [] : List<Medicine>.from(json["Medicine"]!.map((x) => Medicine.fromJson(x))),
    exercise: json["Exercise"] == null ? [] : List<dynamic>.from(json["Exercise"]!.map((x) => x)),
    reports: json["Reports"] == null ? [] : List<dynamic>.from(json["Reports"]!.map((x) => x)),
    tokens: json["Tokens"] == null ? [] : List<Token>.from(json["Tokens"]!.map((x) => Token.fromJson(x))),
    patientName: json["PatientName"],
    age: json["Age"],
    phone: json["Phone"],
    v: json["__v"],
    gender: json["Gender"],
    appointment: json["Appointment"] == null ? [] : List<Appointment>.from(json["Appointment"]!.map((x) => Appointment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "BalancedDiet": balancedDiet?.toJson(),
    "_id": id,
    "Hospital": hospital == null ? [] : List<dynamic>.from(hospital!.map((x) => x.toJson())),
    "Medicine": medicine == null ? [] : List<dynamic>.from(medicine!.map((x) => x.toJson())),
    "Exercise": exercise == null ? [] : List<dynamic>.from(exercise!.map((x) => x)),
    "Reports": reports == null ? [] : List<dynamic>.from(reports!.map((x) => x)),
    "Tokens": tokens == null ? [] : List<dynamic>.from(tokens!.map((x) => x.toJson())),
    "PatientName": patientName,
    "Age": age,
    "Phone": phone,
    "__v": v,
    "Gender": gender,
    "Appointment": appointment == null ? [] : List<dynamic>.from(appointment!.map((x) => x.toJson())),
  };
}

class Appointment {
  String? date;
  String? slot;
  String? status;
  String? id;
  String? hospitalId;

  Appointment({
    this.date,
    this.slot,
    this.status,
    this.id,
    this.hospitalId,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    date: json["Date"],
    slot: json["slot"],
    status: json["status"],
    id: json["_id"],
    hospitalId: json["HospitalID"],
  );

  Map<String, dynamic> toJson() => {
    "Date": date,
    "slot": slot,
    "status": status,
    "_id": id,
    "HospitalID": hospitalId,
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
  String? medicineName;
  String? timeTaken;
  String? mealTime;
  String? picture;
  DateTime? dateAdded;
  String? id;

  Medicine({
    this.medicineName,
    this.timeTaken,
    this.mealTime,
    this.picture,
    this.dateAdded,
    this.id,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    medicineName: json["MedicineName"],
    timeTaken: json["TimeTaken"],
    mealTime: json["MealTime"],
    picture: json["Picture"],
    dateAdded: json["DateAdded"] == null ? null : DateTime.parse(json["DateAdded"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "MedicineName": medicineName,
    "TimeTaken": timeTaken,
    "MealTime": mealTime,
    "Picture": picture,
    "DateAdded": dateAdded?.toIso8601String(),
    "_id": id,
  };
}

class Token {
  String? token;
  String? id;

  Token({
    this.token,
    this.id,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    token: json["token"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "_id": id,
  };
}
