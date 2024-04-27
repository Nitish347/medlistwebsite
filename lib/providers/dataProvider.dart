import 'package:flutter/material.dart';


import '../models/medicine model.dart';

class DataProviders with ChangeNotifier {
  List<MedicineModelOld> medicineList = [];
  void updateMedicineList(List<MedicineModelOld> medicineList) {
    this.medicineList = medicineList;
    notifyListeners();
  }
}
