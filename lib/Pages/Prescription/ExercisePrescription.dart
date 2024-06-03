import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medlistweb/Controller/UserData.dart';
import 'package:medlistweb/Controller/exerciseController.dart';
import 'package:medlistweb/Controller/medicineController.dart';
import 'package:medlistweb/Controller/prescriptionController.dart';
import 'package:medlistweb/models/appointmentModel.dart';
import 'package:medlistweb/models/medicine%20model.dart';
import 'package:medlistweb/utils/lists.dart';
import 'package:medlistweb/widget/ExerciseTextFields.dart';

import '../../../models/MedicineModel.dart';
import '../../../widget/MedicineTextFields.dart';
import '../../../widget/dropdown.dart';
import '../../models/exerscise_post_model.dart';

class ExercisePrescription extends StatefulWidget {
  AppointmentModel appointmentModel;
  ExercisePrescription({Key? key,required this.appointmentModel}) : super(key: key);

  @override
  State<ExercisePrescription> createState() => _ExercisePrescriptionState();
}

class _ExercisePrescriptionState extends State<ExercisePrescription> {

  @override
  void initState() {
    super.initState();
  }
  showPreviousMedicines(double height, double widht, BuildContext context) {
    bool sent = false;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.only(
                top: 10.0,
              ),
              content:Container(
                height: height*0.8,
                width: widht*0.6,
                child: Column(
                  children: [
                    Text("Previous Exercises",style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: height*0.05
                    ),),
                    Container(
                      height: height*0.7,
                      width: widht*0.6,
                      child: Padding(
                        padding:  EdgeInsets.all(widht*0.03),
                        child: ListView(
                          children: List.generate(widget.appointmentModel.exercise?.length ?? 0, (index) {
                            var medicine = widget.appointmentModel.exercise?[index];
                            return Text( "${index+1}  ${medicine?.description ?? ""}" ,style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: height*0.02
                            ));
                          }),
                        ),
                      ),
                    ),
                  ],
                ),

              ));
        });
  }
  final prescriptionController = Get.put(PrescriptionController());
  final exerciseController = Get.put(ExerciseController());
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    showPatientsDetail(double height, double widht) {
      bool sent = false;
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10.0,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.only(
                  top: 10.0,
                ),
                content:Container());
          });
    }

    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

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
                  MedicineBlockTitle(height, width,context),
                  Obx(() {
                    return Column(
                      children: List.generate(prescriptionController
                          .prescribeExercise.length < 5
                          ? 5
                          : prescriptionController.prescribeExercise.length, (
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
                              prescriptionController.prescribeExercise.add(
                                  ExersisePostModel());
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
                              onTap: () {
                                setState(() {
                                  _loading = true;
                                });
                                for (var i in prescriptionController
                                    .prescribeExercise) {
                                  i.id = widget.appointmentModel.id;
                                 exerciseController.postExercise(i);
                                  // log(i.medicineName ?? "null");
                                  // // log(i.timeTaken ?? "null");
                                  // log(i.id ?? "null");

                                }
                                setState(() {
                                  _loading = false;
                                });
                              },
                              child: _loading ?LoadingAnimationWidget.twoRotatingArc(color: Colors.green, size: height*0.05)   :   Container(
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
  Widget MedicineBlockTitle(double height, double width,BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          InkWell(
            onTap: () {
              showPreviousMedicines(height,width,context);
            },
            child: Container(
              alignment: Alignment.center,
              height: height * 0.05,
              width: width * 0.1,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
              child: Text(
                " Previous Exercises ",
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
            "Exercise",
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
            width: width * 0.065,
          ),
        ],
      ),
    );
  }

  Widget MedicineBlock(double? height, double? width, int index) {
    TimeOfDay _selectedTime = TimeOfDay.now();
    DateTime _selectedDateTime = DateTime.now();
    final controller = Get.put(PrescriptionController());
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: _selectedTime,

      );
      if (picked != null && picked != _selectedTime) {
        setState(() {
          print(picked.toString());
          _selectedTime = picked;
          _selectedDateTime = DateTime(
            _selectedDateTime.year,
            _selectedDateTime.month,
            _selectedDateTime.day,
            _selectedTime.hour,
            _selectedTime.minute,
          );
          print(formatter.parse(_selectedDateTime.toString()));
          controller.prescribeExercise[index].timeTaken = formatter.parse(_selectedDateTime.toString());
        });
      }

    }


    final userController = Get.put(UserData());
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
    List<String> exerciseNames = [
      // Yoga poses
      'Sun Salutation',
      'Tree Pose',
      'Downward Dog',
      'Warrior Pose',
      'Child\'s Pose',
      'Bridge Pose',
      'Cat-Cow Stretch',
      'Cobra Pose',
      'Mountain Pose',
      'Seated Forward Bend',
      'Triangle Pose',
      'Lotus Pose',
      'Half Moon Pose',
      'Camel Pose',
      'Bow Pose',
      'Fish Pose',
      'Corpse Pose',
      'Boat Pose',
      'Headstand',
      'Handstand',
      'Pigeon Pose',
      'Crow Pose',
      'Eagle Pose',

      // Traditional exercises
      'Plank',
      'Push-Ups',
      'Squats',
      'Lunges',
      'Bicep Curls',
      'Tricep Dips',
      'Sit-Ups',
      'Crunches',
      'Jumping Jacks',
      'Burpees',
      'High Knees',
      'Mountain Climbers',
      'Leg Raises',
      'Bicycle Crunches',
      'Deadlifts',
      'Bench Press',
      'Overhead Press',
      'Lat Pulldown',
      'Pull-Ups',
      'Chin-Ups',
      'Rowing',
      'Russian Twists',
      'Kettlebell Swings',
    ];
    controller.prescribeMedicine[index].id  = userController.userModel.value.id;
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
          dropdownExercise(exerciseNames, "Medicine", width! * 2.1, index),
          Row(
            children: [
              dropdownExerciseTime(timing, "Time", width, index),
              IconButton(onPressed: (){
                _selectTime(context);

              }, icon: Icon(Icons.calendar_month))
            ],
          ),

          IconButton(onPressed: () {
            controller.prescribeExercise.removeAt(index);
          }, icon: Icon(Icons.delete, color: Colors.red,))
        ],
      ),
    );
  }
}


