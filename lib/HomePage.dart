import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlistweb/widget/DietEntry.dart';
import 'package:medlistweb/widget/Drawer.dart';
import 'package:medlistweb/widget/ExcerciseEntry.dart';
import 'package:medlistweb/widget/MedicineEntry.dart';

import 'models/medicine model.dart';
// import 'package:medloastweb/widget/Leader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          color: Colors.red,
          alignment: Alignment.center,
          height: 45,
          width: 100,
          child: Text(
            "Print",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "MedList",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 300,
                  child: TextField(
                    onChanged: (value) {
                      // phoneNumber = value;
                    },
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.green,
                    onEditingComplete: () {
                      // if (phoneNumber.toString().length > 10)
                      print("noooo");
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        // prefix: Text("  +91"),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        // prefixText: ("  +91 "),
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.green)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    color: Colors.green,
                    alignment: Alignment.center,
                    height: 45,
                    width: 100,
                    child: Text(
                      "Search",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text(
                          "Patient Name : ",
                          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Nitish Chaurasiya",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Phone Number : ",
                          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "8840867665",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    color: Colors.green,
                    alignment: Alignment.center,
                    height: 45,
                    width: 150,
                    child: Text(
                      "Last Medicines",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    color: Colors.green,
                    alignment: Alignment.center,
                    height: 45,
                    width: 90,
                    child: Text(
                      "Last Diet",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    color: Colors.green,
                    alignment: Alignment.center,
                    height: 45,
                    width: 150,
                    child: Text(
                      "Last Exercises",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MedicineEntry(context),
                ExerciseEntry(context),
                DietEntry(context),
              ],
            )
          ],
        ),
      ),
    );
  }
}
