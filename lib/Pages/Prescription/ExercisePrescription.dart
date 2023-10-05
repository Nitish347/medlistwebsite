import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/dropdown.dart';


class ExerciesPrescription extends StatefulWidget {
  const ExerciesPrescription({Key? key}) : super(key: key);

  @override
  State<ExerciesPrescription> createState() => _ExerciesPrescriptionState();
}

class _ExerciesPrescriptionState extends State<ExerciesPrescription> {
  List tabs = [1, 1, 1, 1, 1, 1];

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
                    width: width * 0.85,
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
  List<String> indianYogaAndExercises = [
    "",
    'Aerobic Dance Workouts',
    'Aerobics',
    'Aerial Yoga',
    'Ashtanga Yoga',
    'Badminton',
    'Balance Exercises',
    'Barre Workouts',
    'Basketball',
    'Bikram Yoga',
    'Bodybuilding',
    'Bodyweight Exercises',
    'Bodyweight HIIT',
    'Boxing',
    'Breathing Exercises for Stress Relief',
    'Calisthenics',
    'Capoeira',
    'Cardio Kickboxing',
    'Cardiovascular Exercises',
    'Carrom',
    'Chair Exercises for Seniors',
    'Chair Yoga',
    'Chakra Meditation',
    'Chess',
    'Circuit Training',
    'Cricket',
    'CrossFit',
    'Cycling',
    'Dance Fitness',
    'Dancing',
    'Deep Stretching',
    'Dhyana (Concentration)',
    'Field Hockey',
    'Flexibility Training',
    'Football (Soccer)',
    'Functional Movement',
    'Functional Training',
    'Gymnastics',
    'Hatha Yoga',
    'High-Intensity Interval Training (HIIT)',
    'Hiking',
    'Indoor Cycling (Spin)',
    'Indoor Workouts',
    'Interval Running',
    'Iyengar Yoga',
    'Judo',
    'Kabaddi',
    'Kalaripayattu (Indian Martial Art)',
    'Karate',
    'Kickboxing',
    'Kho-Kho',
    'Kokum',
    'Kokum',
    'Krav Maga',
    'Kundalini Yoga',
    'Low-Impact Exercises',
    'Martial Arts',
    'Mat Pilates',
    'Meditation',
    'Mindful Walking',
    'Pilates',
    'Plyometrics',
    'Power Yoga',
    'Pranayama (Breath Control)',
    'Qigong',
    'Resistance Training',
    'Running',
    'Sapota (Chikoo)',
    'Sivananda Yoga',
    'Sprinting',
    'Strength and Conditioning',
    'Strength Training',
    'Surya Namaskar (Sun Salutation)',
    'Swimming',
    'Swimming for Fitness',
    'Tabata',
    'Table Tennis',
    'Tai Chi',
    'Tae Kwon Do',
    'Tamarind',
    'Tangerine',
    'Tennis',
    'Therapeutic Exercise',
    'Trail Running',
    'Trataka (Candle Gazing)',
    'Vinyasa Yoga',
    'Volleyball',
    'Walking',
    'Watermelon',
    'Wood Apple (Bael Fruit)',
    'Wood Apple (Bael Fruit)',
    'Wushu',
    'Yin Yoga',
    'Yoga Asanas (Physical Postures)',
    'Yoga Nidra',
    'Yogalates (Yoga + Pilates)',
    'Yuzu',
  ];

// You can access the elements in this sorted list for further use.
  List<String> timing = ["", "Morning", "Evening", "Night"];

  return Padding(
    padding: EdgeInsets.only(bottom: height! * 0.025),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "1.",
          style: GoogleFonts.poppins(fontSize: height! * 0.025, fontWeight: FontWeight.w400),
        ),
        dropdown(indianYogaAndExercises, "Fruits", width! * 2.5),
        dropdown(timing, "Medicine", width! * 2.5),
      ],
    ),
  );
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
              " Previous Exercises ",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: width * 0.008,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.1,
        ),
        Text(
          "Exercises",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: width * 0.02,
          ),
        ),
        SizedBox(
          width: width * 0.3,
        ),
        Text(
          "Timing",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: width * 0.02,
          ),
        ),
      ],
    ),
  );
}
