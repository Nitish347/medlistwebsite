import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlistweb/Controller/prescriptionController.dart';
import 'package:medlistweb/models/medicine%20model.dart';
import 'package:medlistweb/utils/lists.dart';

import '../../models/MedicineModel.dart';
import '../../widget/MedicineTextFields.dart';
import '../../widget/dropdown.dart';

class MedicinePrescription extends StatefulWidget {
  const MedicinePrescription({Key? key}) : super(key: key);

  @override
  State<MedicinePrescription> createState() => _MedicinePrescriptionState();
}

class _MedicinePrescriptionState extends State<MedicinePrescription> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    final prescriptionController = Get.put(PrescriptionController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(010),
        child: Container(
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 10.0,
                ),
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 10.0)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.005,
                  ),
                  MedicineBlockTitle(height, width),
                  Obx(() {
                    return Column(
                      children: List.generate(prescriptionController
                          .prescribeMedicine.length < 5
                          ? 5
                          : prescriptionController.prescribeMedicine.length, (
                          index) {
                        return MedicineBlock(height, width, index);
                      }),
                    );
                  }),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    width: width * 0.86,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              prescriptionController.prescribeMedicine.add(
                                  MedicineModel());
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.05,
                            width: width * 0.08,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "Add More +",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: width * 0.01,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                for (var i in prescriptionController
                                    .prescribeMedicine) {
                                  log(i.medicineName ?? "null");
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.05,
                                width: width * 0.07,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Clear All",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: width * 0.01,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.05,
                                width: width * 0.07,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Save",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: width * 0.01,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget MedicineBlock(double? height, double? width, int index) {
    final controller = Get.put(PrescriptionController());
    List<String> timing = [ "Morning", "Evening", "Night"];
    List<String> amount = [ "0.5", "1", "1.5", "2", "3", "4", "5"];
    List<String> meal = [

      "Before breakfast",
      "After Breakfast",
      "Before Lunch",
      "After Lunch",
      "Before Dinner",
      "After Dinner"
    ];
    List<String> medicineNames = [
      "Aspirin",
      "Ibuprofen",
      "Acetaminophen",
      "Penicillin",
      "Amoxicillin",
      "Ciprofloxacin",
      "Doxycycline",
      "Prednisone",
      "Lisinopril",
      "Amlodipine",
      "Metformin",
      "Simvastatin",
      "Atorvastatin",
      "Alprazolam",
      "Sertraline",
      "Omeprazole",
      "Ranitidine",
      "Pantoprazole",
      "Metoprolol",
      "Propranolol",
      "Hydrochlorothiazide",
      "Furosemide",
      "Levothyroxine",
      "Warfarin",
      "Clopidogrel",
      "Metronidazole",
      "Fluoxetine",
      "Escitalopram",
      "Duloxetine",
      "Gabapentin",
      "Pregabalin",
      "Lorazepam",
      "Clonazepam",
      "Diazepam",
      "Tramadol",
      "Morphine",
      "Oxycodone",
      "Hydrocodone",
      "Codeine",
      "Morphine",
      "Fentanyl",
      // Add more medicine names as needed
    ];

    return Padding(
      padding: EdgeInsets.only(bottom: height! * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            (index + 1).toString(),
            style: GoogleFonts.poppins(
                fontSize: height * 0.025, fontWeight: FontWeight.w400),
          ),
          dropdownMedicine(medicineNames, "Medicine", width! * 2.1, index),
          dropdownMedicineTime(timing, "Time", width, index),
          dropdownMedicineMealTime(meal, "Meal", width * 1.5, index),
          dropdownMedicineAmount(amount, "Amount", width, index),
          IconButton(onPressed: () {
            controller.prescribeMedicine.removeAt(index);
          }, icon: Icon(Icons.delete, color: Colors.red,))
        ],
      ),
    );
  }
}

Widget MedicineBlockTitle(double height, double width) {
  return Padding(
    padding: EdgeInsets.only(bottom: height * 0.025),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.065,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            height: height * 0.05,
            width: width * 0.1,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(50)),
            child: Text(
              " Previous Medicines ",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: width * 0.008,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Text(
          "Medicine",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: width * 0.02,
          ),
        ),
        SizedBox(
          width: width * 0.14,
        ),
        Text(
          "Time",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: width * 0.02,
          ),
        ),
        SizedBox(
          width: width * 0.12,
        ),
        Text(
          "Meal Time",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: width * 0.02,
          ),
        ),
        SizedBox(
          width: width * 0.12,
        ),
        Text(
          "Amount",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: width * 0.02,
          ),
        ),
      ],
    ),
  );
}
