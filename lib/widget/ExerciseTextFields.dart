// *************************************************MEDICINE NAME*******************************************************************
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Controller/prescriptionController.dart';

Widget dropdownExercise(
    List<String> options, String hint, double width, int index,
    [bool grey = true]) {
  final controller = Get.put(PrescriptionController());
  return SizedBox(
    width: width * 0.14,
    child: DropdownMenu<String>(
      width: width * 0.12,
      menuHeight: 300,
      enableFilter: true,
      textStyle: const TextStyle(color: Colors.black, fontSize: 14),
      trailingIcon: const Icon(
        Icons.arrow_drop_down_rounded,
        color: Colors.green,
      ),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey)),
          labelStyle: GoogleFonts.poppins(color: Colors.grey),
          focusColor: Colors.green,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green.withOpacity(0.5),
              )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1.5)),
          iconColor: Colors.green),
      initialSelection: "",
      label: Text(
        hint,
        style: GoogleFonts.poppins(color: Colors.green),
      ),
      onSelected: (String? value) {
        controller.prescribeExercise[index].description = value;
      },
      dropdownMenuEntries:
      options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    ),
  );
}
// *************************************************MEDICINE TIME*******************************************************************

List<String> timing = [ "Morning", "Evening", "Night"];
Widget dropdownExerciseTime(
    List<String> options, String hint, double width, int index,
    [bool grey = true]) {
  final DateFormat formatter = DateFormat('yyyy-MM-ddTHH:mm:ss');
  final controller = Get.put(PrescriptionController());
  return Container(
    width: width * 0.14,
    child: DropdownMenu<String>(
      width: width * 0.12,
      menuHeight: 300,
      enableFilter: true,
      textStyle: const TextStyle(color: Colors.black, fontSize: 14),
      trailingIcon: const Icon(
        Icons.arrow_drop_down_rounded,
        color: Colors.green,
      ),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey)),
          labelStyle: GoogleFonts.poppins(color: Colors.grey),
          focusColor: Colors.green,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green.withOpacity(0.5),
              )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1.5)),
          iconColor: Colors.green),
      initialSelection: "",
      label: Text(
        hint,
        style: GoogleFonts.poppins(color: Colors.green),
      ),
      onSelected: (String? value) {
        if(value=="Morning" ){
          controller.prescribeExercise[index].timeTaken =  formatter.parse("2040-10-28T06:00:00");
        }else if(value == "Evening"){
          controller.prescribeExercise[index].timeTaken =  formatter.parse("2040-10-28T12:00:00");
        }else{
          controller.prescribeExercise[index].timeTaken =  formatter.parse("2040-10-28T18:00:00");
        }
      },
      dropdownMenuEntries:
      options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    ),
  );
}