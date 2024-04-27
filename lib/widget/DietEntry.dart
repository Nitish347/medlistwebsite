import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dataentry.dart';
import 'dietdataEntry.dart';

Widget DietEntry(
  BuildContext context,
) {
  List<String> ls = [];
  List<String> ls2 = [];
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  var selectedTime;
  return SingleChildScrollView(
    child: Container(
      width: width / 4,
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
              "What to eat",
              style: GoogleFonts.alatsi(
                  fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(5, (index) {
                return dietdataEntry(context, "Diet", ls);
              }),
            ),Text(
              "What to avoid",
              style: GoogleFonts.alatsi(
                  fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(5, (index) {
                return dietdataEntry(context, "Avoid", ls2);
              }),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 50,
                width: 150,
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
                // await FireStoreMethod.dietPlan(context, "uid", ls,ls2);
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
    ),
  );
}
