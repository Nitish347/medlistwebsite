class MedicineModel {
  int? id;
  String? title;
  DateTime? alarmDateTime;

  MedicineModel({
    this.id,
    this.title,
    this.alarmDateTime,
  });

  factory MedicineModel.fromMap(Map<String, dynamic> json) => MedicineModel(
        id: json["id"],
        title: json["title"],
        alarmDateTime:
            DateTime.parse(json["alarmDateTime"].toDate().toString()),
      );
  factory MedicineModel.fromMap1(Map<String, dynamic> json) => MedicineModel(
        id: json["id"],
        title: json["title"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime!.toIso8601String(),
      };
}
