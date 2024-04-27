class MedicineModelOld {
  int? id;
  String? title;
  DateTime? alarmDateTime;

  MedicineModelOld({
    this.id,
    this.title,
    this.alarmDateTime,
  });

  factory MedicineModelOld.fromMap(Map<String, dynamic> json) => MedicineModelOld(
        id: json["id"],
        title: json["title"],
        alarmDateTime:
            DateTime.parse(json["alarmDateTime"].toDate().toString()),
      );
  factory MedicineModelOld.fromMap1(Map<String, dynamic> json) => MedicineModelOld(
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
