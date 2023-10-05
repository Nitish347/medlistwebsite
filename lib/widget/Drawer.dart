import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget drawer() {
  return Drawer(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: double.maxFinite,
          color: Colors.amber,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                  Text(
                    "Dr.Shivika Tyagi",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
