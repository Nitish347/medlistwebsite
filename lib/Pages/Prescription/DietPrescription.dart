import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medlistweb/Controller/UserData.dart';
import 'package:medlistweb/Controller/dietCotroller.dart';
import 'package:medlistweb/Controller/medicineController.dart';
import 'package:medlistweb/Controller/prescriptionController.dart';
import 'package:medlistweb/models/appointmentModel.dart';
import 'package:medlistweb/models/eat_model.dart';
import 'package:medlistweb/models/medicine%20model.dart';
import 'package:medlistweb/utils/lists.dart';
import 'package:medlistweb/widget/DietTextField.dart';

import '../../../models/MedicineModel.dart';
import '../../../widget/MedicineTextFields.dart';
import '../../../widget/dropdown.dart';

class DietPrescription extends StatefulWidget {
  AppointmentModel appointmentModel;
  DietPrescription({Key? key,required this.appointmentModel}) : super(key: key);

  @override
  State<DietPrescription> createState() => _DietPrescriptionState();
}

class _DietPrescriptionState extends State<DietPrescription> {

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
                    Text("Previous What to Eat",style: GoogleFonts.poppins(
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
                          children: List.generate(widget.appointmentModel.balancedDiet?.whatToEat?.length ?? 0, (index) {
                            var food = widget.appointmentModel.balancedDiet?.whatToEat?[index];
                            return Text( "${index+1}  ${food?.foodItem ?? ""}" ,style: GoogleFonts.poppins(
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
  showPreviousWhatToAvoid(double height, double widht, BuildContext context) {
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
                    Text("Previous What to Avoid",style: GoogleFonts.poppins(
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
                          children: List.generate(widget.appointmentModel.balancedDiet?.whatNotToEat?.length ?? 0, (index) {
                            var food = widget.appointmentModel.balancedDiet?.whatNotToEat?[index];
                            return Text( "${index+1}  ${food?.foodItem ?? ""}" ,style: GoogleFonts.poppins(
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
  final dietController = Get.put(DietController());
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
                          .presWhatToEat.length < 3
                          ? 5
                          : prescriptionController.presWhatToEat.length, (
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
                        SizedBox(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              prescriptionController.presWhatToEat.add(
                                  Eat());
                              prescriptionController.presWhatToAvoid.add(
                                  Eat());
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
                                    .presWhatToEat) {
                                  i.id = widget.appointmentModel.id;
                                  dietController.postWhatToEat(i);
                                  log(i.d ?? "null");
                                  // log(i.timeTaken ?? "null");
                                  log(i.id ?? "null");
                                }
                                for (var i in prescriptionController
                                    .presWhatToAvoid) {
                                  i.id = widget.appointmentModel.id;
                                  dietController.postWhatToAvoid(i);
                                  log(i.d ?? "null");
                                  // log(i.timeTaken ?? "null");
                                  log(i.id ?? "null");
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
SizedBox(),
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
                " Previous What to Eat ",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: width * 0.008,
                ),
              ),
            ),
          ),
          Text(
            "What to Eat",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: width * 0.02,
            ),
          ),

          Text(
            "What to Avoid",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: width * 0.02,
            ),
          ),
          InkWell(
            onTap: () {
              showPreviousWhatToAvoid(height,width,context);
            },
            child: Container(
              alignment: Alignment.center,
              height: height * 0.05,
              width: width * 0.1,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
              child: Text(
                " Previous What to Avoid ",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: width * 0.008,
                ),
              ),
            ),
          ),
          SizedBox(),
        ],
      ),
    );
  }

  Widget MedicineBlock(double? height, double? width, int index) {
    final controller = Get.put(PrescriptionController());
    final userController = Get.put(UserData());
    List<String> healthyFoods = [
      // Vegetables
      "Spinach",
      "Broccoli",
      "Carrots",
      "Cauliflower",
      "Bitter gourd",
      "Bottle gourd",
      "Drumstick (Moringa)",
      "Bell peppers",
      "Tomatoes",
      "Pumpkin",
      "Green beans",
      "Beetroot",
      "Okra (Ladyfinger)",

      // Fruits
      "Apples",
      "Bananas",
      "Oranges",
      "Papayas",
      "Mangoes",
      "Pomegranates",
      "Guavas",
      "Grapes",
      "Pineapple",
      "Watermelon",
      "Strawberries",
      "Kiwi",

      // Legumes and Pulses
      "Lentils (Masoor dal)",
      "Chickpeas (Chana)",
      "Green gram (Moong dal)",
      "Black gram (Urad dal)",
      "Pigeon peas (Toor dal)",
      "Kidney beans (Rajma)",
      "Soybeans",
      "Black-eyed peas (Lobia)",

      // Grains
      "Brown rice",
      "Quinoa",
      "Millet (Ragi, Bajra)",
      "Whole wheat",
      "Oats",
      "Barley",
      "Buckwheat",

      // Nuts and Seeds
      "Almonds",
      "Walnuts",
      "Flax seeds",
      "Chia seeds",
      "Sunflower seeds",
      "Pumpkin seeds",
      "Cashews",
      "Pistachios",

      // Dairy Products
      "Yogurt (Dahi)",
      "Paneer (Cottage cheese)",
      "Buttermilk (Chaas)",
      "Ghee (Clarified butter)",
      "Milk",

      // Spices and Herbs
      "Turmeric",
      "Cumin",
      "Coriander",
      "Ginger",
      "Garlic",
      "Basil",
      "Mint",
      "Fenugreek",
      "Cinnamon",
      "Cardamom",
      "Cloves",
      "Black pepper",
      "Mustard seeds",
      "Saffron",

      // Fish and Seafood
      "Salmon",
      "Mackerel",
      "Sardines",
      "Prawns",
      "Rohu",
      "Hilsa",

      // Lean Meats
      "Chicken breast",
      "Turkey",
      "Lean cuts of lamb",

      // Healthy Oils
      "Coconut oil",
      "Olive oil",
      "Mustard oil",
      "Sesame oil",

      // Beverages
      "Green tea",
      "Herbal teas",
      "Coconut water",

      // Others
      "Honey",
      "Jaggery",
      "Amla (Indian gooseberry)",
      "Tur dal",
      "Split peas"
    ];
    controller.presWhatToEat[index].id  = userController.userModel.value.id;
    controller.presWhatToAvoid[index].id  = userController.userModel.value.id;
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
          dropdownWhatToEat(healthyFoods, "Eat", width! * 2.1, index),
          IconButton(onPressed: () {
            controller.presWhatToEat.removeAt(index);
          }, icon: Icon(Icons.delete, color: Colors.red,)),
          dropdownWhatToAvoid(healthyFoods, "Avoid",  width* 2.1, index),
          IconButton(onPressed: () {
            controller.presWhatToAvoid.removeAt(index);
          }, icon: Icon(Icons.delete, color: Colors.red,))
        ],
      ),
    );
  }
}


