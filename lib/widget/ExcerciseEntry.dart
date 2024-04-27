import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/medicine model.dart';
import 'dataentry.dart';

Widget ExerciseEntry(BuildContext context) {
  List<Map<String, dynamic>> list2 = [];
  List<String> lsname1 = [];
  List<DateTime> lstime1 = [];
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
            "Exercises",
            style: GoogleFonts.alatsi(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(5, (index) {
              return dataEntry(context, "Exercise Name", lsname1, lstime1);
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
          InkWell(
            onTap: () async {
              for (int i = 0; i < lstime1.length; i++) {
                MedicineModelOld medicineModel = MedicineModelOld();
                medicineModel.title = lsname1[i];
                medicineModel.alarmDateTime = lstime1[i];
                medicineModel.id = 1000 * i + 1;
                Map<String, dynamic> mp = medicineModel.toMap();
                list2.add(mp);
              }

              // await FireStoreMethod.exerciseData(context, "uid", list2);
              print(list2);
            },
            child: Center(
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
          )
        ],
      ),
    ),
  );
}
