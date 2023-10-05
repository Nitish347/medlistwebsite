import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlistweb/utils/lists.dart';

import '../../widget/dropdown.dart';

class MedicinePrescription extends StatefulWidget {
  const MedicinePrescription({Key? key}) : super(key: key);

  @override
  State<MedicinePrescription> createState() => _MedicinePrescriptionState();
}

class _MedicinePrescriptionState extends State<MedicinePrescription> {
  List tabs = [1, 1, 1, 1, 1, 1];
  List<DropDownValueModel> MedicineNamesList = [];
  add() {
    for (var i in medicineNames) {
      DropDownValueModel dropDownValueModel = DropDownValueModel(name: i, value: i);
      MedicineNamesList.add(dropDownValueModel);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    add();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
              // border: Border.all(
              //     // color: Colors.green,
              //     ),
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
                  Column(
                    children: List.generate(tabs.length, (index) {
                      return MedicineBlock(height, width);
                    }),
                  ),
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
                              tabs.add(1);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.05,
                            width: width * 0.08,
                            decoration: BoxDecoration(
                                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
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
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.05,
                                width: width * 0.07,
                                decoration: BoxDecoration(
                                    color: Colors.red, borderRadius: BorderRadius.circular(50)),
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
                                    color: Colors.green, borderRadius: BorderRadius.circular(50)),
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

  Widget dropDown2(String label, String PlaceHolder, String Controller, List<DropDownValueModel> ls,
      double width, SingleValueDropDownController cntrl) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Expanded(
        child: Container(
          width: width,
          child: DropDownTextField(
            // initialValue: "name4",
            controller: cntrl,
            clearOption: true,
            // enableSearch: true,
            // dropdownColor: Colors.green,
            textFieldDecoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff002395), width: 1)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff002395),
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.only(bottom: 3, left: 20),
              labelText: label,
              labelStyle: GoogleFonts.poppins(color: Color(0xff002395)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: PlaceHolder,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            validator: (value) {
              if (value == null) {
                return "Required field";
              } else {
                return null;
              }
            },
            dropDownItemCount: 6,

            dropDownList: ls,
            onChanged: (val) {
              setState(() {
                Controller = val.toString();
              });
            },
          ),
        ),
      ),
    );
  }

  Widget medicineTextField(String hint, double height, double width) {
    return Container(
      width: width * 0.3,
      child: TextField(
        decoration: InputDecoration(
          counterText: "",
          hintText: hint,
          filled: true,
          fillColor: Colors.blueGrey[50],
          labelText: hint,
          labelStyle: GoogleFonts.poppins(fontSize: height * 0.018, color: Colors.green),
          hintStyle:
              GoogleFonts.poppins(fontSize: height * 0.019, color: Colors.grey.withOpacity(0.8)),
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Widget MedicineBlock(double? height, double? width) {
    List<String> timing = ["", "Morning", "Evening", "Night"];
    List<String> amount = ["", "0.5", "1", "1.5", "2", "3", "4", "5"];
    List<String> meal = [
      "",
      "Before breakfast",
      "After Breakfast",
      "Before Lunch",
      "After Lunch",
      "Before Dinner",
      "After Dinner"
    ];
    List<String> medicineNames = [
      "",
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
            "1.",
            style: GoogleFonts.poppins(fontSize: height! * 0.025, fontWeight: FontWeight.w400),
          ),
          dropdown(medicineNames, "Medicine", width! * 2.1),
          dropdown(timing, "Time", width!),
          dropdown(meal, "Meal", width * 1.5),
          dropdown(amount, "Amount", width)
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
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(50)),
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
