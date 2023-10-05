import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../FirestoreMethod/FirestoreMethods.dart';
import '../models/medicine model.dart';
import 'dataentry.dart';

Widget MedicineEntry(BuildContext context) {
  List<Map<String, dynamic>> list1 = [];
  List<String> lsname = [];
  List<DateTime> lstime = [];
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  var selectedTime;
  return Container(
    width: width / 3,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white.withOpacity(0.5)),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width / 20,
          ),
          Text(
            "Medicines",
            style: GoogleFonts.alatsi(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(5, (index) {
              return dataEntry(context, "Medicine Name", lsname, lstime);
            }),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.withOpacity(0.2)),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () async {
                for (int i = 0; i < lstime.length; i++) {
                  MedicineModel medicineModel = MedicineModel();
                  medicineModel.title = lsname[i];
                  medicineModel.alarmDateTime = lstime[i];
                  medicineModel.id = 100 * i;
                  Map<String, dynamic> mp = medicineModel.toMap();
                  list1.add(mp);
                }
                await FireStoreMethod.medicinesData(context, "uid", list1);
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green),
                child: Center(
                    child: Text(
                  "Save",
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
