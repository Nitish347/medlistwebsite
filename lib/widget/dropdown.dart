import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget dropdown(List<String> options, String hint, double width, [bool grey = true]) {
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
              borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.grey)),
          labelStyle: GoogleFonts.poppins(color: Colors.grey),
          focusColor: Colors.green,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.green.withOpacity(0.5),
          )),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1.5)),
          iconColor: Colors.green),
      initialSelection: options.first,
      // hintText: "Gender",
      label: Text(hint),
      onSelected: (String? value) {
        // This is called when the user selects an item.
      },
      dropdownMenuEntries: options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    ),
  );
}
