import 'package:flutter/material.dart';


import '../models/medicine model.dart';

class DataProviders with ChangeNotifier {
  List<MedicineModel> medicineList = [];
  void updateMedicineList(List<MedicineModel> medicineList) {
    this.medicineList = medicineList;
    notifyListeners();
  }
}
