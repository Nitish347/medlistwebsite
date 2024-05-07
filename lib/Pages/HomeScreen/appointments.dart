import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlistweb/Controller/UserData.dart';
import '../presripition.dart';

Widget Appointment(double height, double width, BuildContext context) {
  final controller = Get.put(UserData());


  return Container(
    width: width,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.06,
              width: width * 0.25,
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
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10),
                    ),
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
              width: width * 0.01,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: height * 0.06,
                width: width * 0.07,
                decoration:
                    BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Search",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: width * 0.01,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  width: width * 0.2,
                  height: height * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.green,
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
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 10.0,
                        ),
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(4.0, 4.0),
                            blurRadius: 5.0)
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  width: width * 0.7,
                  child: Center(
                      child: Text(
                    'Appointments',
                    style: GoogleFonts.poppins(
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.7,
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
                  width: width * 0.7,
                  child: ListView(children: <Widget>[
                    DataTable(
                        dataRowHeight: height * 0.08,
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[150],
                        ),
                        dividerThickness: 2,
                        showCheckboxColumn: false,
                        columns: const [
                          DataColumn(
                              label: Text('ID',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('     Name',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Gneder',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Payment',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Booked Time',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                        ],
                        rows: List.generate(controller.appointmentList.length, (index) {
                            var user = controller.appointmentList[index];
                          return DataRow(
                              onSelectChanged: (val) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  PrescriptionScreen(
                                          appointmentModel: controller.appointmentList[index],
                                        )));
                              },
                              cells:  [
                                DataCell(Text('1')),
                                DataCell(ListTile(
                                  title: Text(user.patientName ?? ""),
                                  subtitle: Text(user.phone ?? ""),
                                  leading: CircleAvatar(),
                                )),
                                DataCell(Text(user.gender ?? "")),
                                DataCell(Text('Paid')),
                                DataCell(Text(user.appointment?[0].date ?? "")),
                              ]);
                        })),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
