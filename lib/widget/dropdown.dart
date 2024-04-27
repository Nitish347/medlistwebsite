import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlistweb/Controller/prescriptionController.dart';
import 'package:medlistweb/OBSdata.dart';
import 'package:medlistweb/Pages/Prescription/MedicinesPrescription.dart';
import 'package:medlistweb/models/medicine%20model.dart';

Widget dropdown(List<String> options, String hint, double width,
    [bool grey = true]) {
  final controller = Get.put(ObsData());
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
        // This is called when the user selects an item.
        controller.medicines.add(MedicineModelOld.fromMap({"title": value!}));
      },
      dropdownMenuEntries:
          options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    ),
  );
}

// ********************************************************************************************************************

Widget dropdown1(
    List<String> options,
    String hint,
    double width,
    TextEditingController controller,
    Function(TextEditingController, String) fun,
    [bool grey = true]) {
  return Container(
    width: width * 0.14,
    child: DropdownMenu<String>(
      width: width * 0.12,
      menuHeight: 300,
      enableFilter: true,
      textStyle: TextStyle(color: Colors.black, fontSize: 14),
      trailingIcon: Icon(
        Icons.arrow_drop_down_rounded,
        color: Colors.green,
      ),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey)),
          labelStyle: GoogleFonts.poppins(color: Colors.grey),
          focusColor: Colors.green,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.green.withOpacity(0.5),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1.5)),
          iconColor: Colors.green),
      initialSelection: "",
      // hintText: "Gender",
      label: Text(
        hint,
        style: GoogleFonts.poppins(color: Colors.green),
      ),
      onSelected: (String? value) {
        fun(controller, value!);
      },
      dropdownMenuEntries:
          options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    ),
  );
}
