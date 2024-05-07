import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:medlistweb/models/appointmentModel.dart';

import 'Prescription/DietPrescription.dart';
import 'Prescription/ExercisePrescription.dart';
import 'Prescription/MedicinesPrescription.dart';

class PrescriptionScreen extends StatefulWidget {
  AppointmentModel appointmentModel;
   PrescriptionScreen({Key? key,required this.appointmentModel}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List tabs = [MedicinePrescription(appointmentModel: widget.appointmentModel), DietPrescription(), ExerciesPrescription()];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Prescription",
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.appointmentModel.patientName ?? "",
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.022,
                            fontWeight: FontWeight.w600,
                            color: Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ), InkWell(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.06,
                      width: width * 0.1,
                      decoration: BoxDecoration(
                          color: index == 0 ? Colors.green : Colors.grey.withOpacity(0.1),
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Medicines",
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.018,
                            color: index == 0 ? Colors.white : Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.06,
                      width: width * 0.1,
                      decoration: BoxDecoration(
                          color: index == 1 ? Colors.green : Colors.grey.withOpacity(0.1),
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Diets",
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.018,
                            color: index == 1 ? Colors.white : Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.06,
                      width: width * 0.1,
                      decoration: BoxDecoration(
                          color: index == 2 ? Colors.green : Colors.grey.withOpacity(0.1),
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Exercises",
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.018,
                            color: index == 2 ? Colors.white : Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.8,
                child: tabs[index],
              )
              // Padding(
              //   padding: EdgeInsets.all(height * 0.01),
              //   child: DefaultTabController(
              //       length: 3,
              //       child: Column(
              //         children: [
              //           Container(
              //             width: width * 0.5,
              //             child: SegmentedTabControl(
              //               radius: Radius.circular(20),
              //               backgroundColor: Colors.white,
              //               indicatorColor: Colors.green,
              //               tabTextColor: Colors.black,
              //               squeezeIntensity: 2,
              //               splashColor: Colors.green,
              //               height: height * 0.05,
              //               textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15),
              //               tabPadding: EdgeInsets.symmetric(horizontal: 8),
              //               tabs: const [
              //                 SegmentTab(
              //                   label: "Medicines",
              //                   textColor: Colors.green,
              //                 ),
              //                 SegmentTab(
              //                   label: "Diets",
              //                   textColor: Colors.green,
              //                 ),
              //                 SegmentTab(
              //                   label: "Exercises",
              //                   textColor: Colors.green,
              //                 ),
              //               ],
              //             ),
              //           ),
              //           SizedBox(
              //             height: height * 0.02,
              //           ),
              //           Container(
              //             height: height * 0.78,
              //             child: TabBarView(
              //               physics: BouncingScrollPhysics(),
              //               children: [
              //                 Center(
              //                   child: MedicinePrescription(),
              //                 ),
              //                 Center(
              //                   child: DietPrescription(),
              //                 ),
              //                 Center(
              //                   child: ExerciesPrescription(),
              //                 ),
              //               ],
              //             ),
              //           )
              //         ],
              //       )),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Container(
              //       width: width * 0.15,
              //       height: height * 0.5,
              //       decoration: BoxDecoration(
              //           color: Colors.green,
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.white.withOpacity(0.5),
              //               blurRadius: 10.0,
              //             ),
              //             BoxShadow(
              //                 color: Colors.black.withOpacity(0.4),
              //                 offset: Offset(4.0, 4.0),
              //                 blurRadius: 10.0)
              //           ],
              //           // border: Border.all(
              //           //     // color: Colors.green,
              //           //     ),
              //           borderRadius: BorderRadius.circular(8)),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Text(
              //             "Medicines",
              //             style: GoogleFonts.poppins(
              //                 fontSize: height * 0.03,
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //           Divider(
              //             color: Colors.white,
              //           ),
              //           Text(
              //             "Diet",
              //             style: GoogleFonts.poppins(
              //                 fontSize: height * 0.03,
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //           Divider(
              //             color: Colors.white,
              //           ),
              //           Text(
              //             "Exercise",
              //             style: GoogleFonts.poppins(
              //                 fontSize: height * 0.03,
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //           Divider(
              //             color: Colors.white,
              //           ),
              //           Text(
              //             "Exercise",
              //             style: GoogleFonts.poppins(
              //                 fontSize: height * 0.03,
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       width: width * 0.8,
              //       height: height * 0.9,
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.white.withOpacity(0.5),
              //               blurRadius: 10.0,
              //             ),
              //             BoxShadow(
              //                 color: Colors.black.withOpacity(0.4),
              //                 offset: Offset(4.0, 4.0),
              //                 blurRadius: 10.0)
              //           ],
              //           // border: Border.all(
              //           //     // color: Colors.green,
              //           //     ),
              //           borderRadius: BorderRadius.circular(8)),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
