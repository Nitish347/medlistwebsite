import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:medlistweb/Controller/SigninController.dart';
import 'package:medlistweb/Controller/authHandler.dart';
import 'package:medlistweb/OBSdata.dart';
import 'package:medlistweb/Pages/Auth/verify.dart';
import 'package:medlistweb/constants/fields.dart';

import '../../FirestoreMethod/authMedthods.dart';
import '../../models/UserModel.dart';
import '../../widget/dropdown.dart';
import '../home.dart';
import 'LoginPage.dart';
import 'loginUser.dart';

class RegisterUser extends StatefulWidget {
  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool register = false;
  changeR() {
    setState(() {
      register = true;
    });
  }

  void changeS() {
    setState(() {
      register = false;
    });
  }

  final obsController = Get.put(ObsData());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFf5f5f5),
        body: Stack(
          children: [
            Positioned(
              top: height * 0.07,
              child: Container(
                height: height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  // padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                  children: [
                    // MediaQuery.of(context).size.width >= 600 ? Menu() : SizedBox(), // Responsive
                    Center(
                        child: Body(
                      sign: changeS,
                      reg: changeR,
                      register: register,
                    )),
                    SizedBox(
                      height: height * 0.05,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 50),
                    child: Menu(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _menuItem(title: 'Home'),
              _menuItem(title: 'About us'),
              _menuItem(title: 'Contact us'),
              _menuItem(title: 'Help'),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.1),
            child: InkWell(
              onTap: () => Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => LoginPageUser())),
              child: Container(
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(color: Colors.green),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  Function reg;
  Function sign;
  bool register;

  Body({required this.reg, required this.sign, required this.register});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  optionSetValue(TextEditingController controller, String value) {
    setState(() {
      controller.text = value;
    });
  }

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              height: width >= 800 ? height * 0.03 : height * 0.1,
            ),
            Container(
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
              width: width * 0.97,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: formRegister1(height, width, context, _formKey, optionSetValue),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            )
          ],
        )
      ],
    );
  }

  Widget formRegister1(double height, double width, BuildContext context,
      GlobalKey<FormState> _formKey, Function(TextEditingController, String) fun) {
    List<String> genderOptions = ['Male', 'Female', 'Other'];
    List<String> doctorSpecializations = [
      'Cardiology',
      'Dermatology',
      'Endocrinology',
      'Gastroenterology',
      'Hematology',
      'Neurology',
      'Oncology',
      'Orthopedics',
      'Pediatrics',
      'Psychiatry',
      'Pulmonology',
      'Rheumatology',
      'Nephrology',
      'Ophthalmology',
      'Obstetrics and Gynecology',
      'Urology',
      'ENT (Otolaryngology)',
      'Dentistry',
      'Gynecology',
      'Internal Medicine',
      'Allergy and Immunology',
      'Anesthesiology',
      'Cardiothoracic Surgery',
      'Colorectal Surgery',
      'Critical Care Medicine',
      'Dental Surgery',
      'Diagnostic Radiology',
      'Emergency Medicine',
      'Family Medicine',
      'General Surgery',
      'Geriatric Medicine',
      'Infectious Disease',
      'Interventional Radiology',
      'Medical Genetics',
      'Nuclear Medicine',
      'Nutrition and Dietetics',
      'Osteopathy',
      'Pain Medicine',
      'Pathology',
      'Physical Medicine and Rehabilitation',
      'Plastic Surgery',
      'Podiatry',
      'Preventive Medicine',
      'Radiation Oncology',
      'Sports Medicine',
      'Surgical Oncology',
      'Transplant Surgery',
      'Vascular Surgery',
    ];

    return Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/medlist.png",
                    height: height * 0.15,
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Image.asset("assets/images/doc.webp"),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: height * 0.15,
                          height: height * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.green),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 2))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-unknown-social-media-user-photo-default-avatar-profile-icon-vector-unknown-social-media-user-184816085.jpg",
                                  ))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 10,
                            child: Container(
                              height: height * 0.04,
                              width: height * 0.04,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.green,
                                ),
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Center(
                    child: Text(
                      "Upload Picture",
                      style: GoogleFonts.poppins(fontSize: height * 0.022, color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Container(
                    width: width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textField1("First Name", "name", false, false, height, width / 2.1,
                            firstName, validateFName),
                        textField1("Last Name", "name", false, false, height, width / 2.1, lastName,
                            validateLName),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    width: width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textField1("Email", "name", false, false, height, width / 2.1, email,
                            validateEmail),
                        textField1("Phone Number", "name", false, false, height, width / 2.1,
                            phoneNumber, validatePhoneNumber),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textField1("Hospital/Clinic Name", "name", false, false, height, width,
                      hospitalName, validateHospitalName),
                  SizedBox(height: height * 0.02),
                  textField1("Hospital/Clinic Address", "name", false, false, height, width,
                      hospitalAddress, validateHospitalAddress),
                  SizedBox(height: height * 0.02),
                  Container(
                    width: width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        dropdown1(genderOptions, "Gender", width, gender, fun),
                        dropdown1(
                            doctorSpecializations, "Specialization", width, specialization, fun),
                        textField1("Appointment Fee Rs.", "name", false, false, height, width * 0.4,
                            fee, validateFee),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  textField1("About", "name", false, false, height, width, about, validateAbout),
                  SizedBox(height: height * 0.02),
                  Container(
                    width: width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textField1("Password", "name", true, false, height, width / 2.1, password,
                            validatePassword),
                        textField1("Confirm Password", "name", true, false, height, width / 2.1,
                            confirmPassword, validatePassword),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple[100]!,
                          spreadRadius: 10,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        log(gender.text);
                        log(specialization.text);
                        setState(() {
                          _loading = true;
                        });
                        // String data = FirebaseAuthMethods().sendOTP("PhoneNumber");

                        // if (_formKey.currentState?.validate() ?? false) {
    if(true){
                          if (true) {
                            var json = {
                              "FirstName": firstName.text,
                              "LastName": lastName.text,
                              "Email": email.text,
                              "Phone": phoneNumber.text,
                              "HospitalName": hospitalName.text,
                              "DoctorName": firstName.text + lastName.text,
                              "Address": hospitalAddress.text,
                              "Gender": gender.text,
                              "Specialization": specialization.text,
                              "About": about.text,
                              "Password": password.text
                            };
                            UserModel NewUser = UserModel.fromJson(json);
                            // var data = await SigninController.signin(json);
                            // await FirebaseAuthMethods().signUpEmail(email.text, password.text);
                            Get.to(VerifyPage(
                              // id: data['_id'],
                              isLoagin: false,
                              user: NewUser,
                            ));
                          }
                        }
                        // Get.to(()=>HomeScreen());
                        setState(() {
                          _loading = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        // onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: SizedBox(
                          width: width * 0.48,
                          height: 50,
                          child: Center(
                              child: _loading
                                  ? LoadingAnimationWidget.waveDots(
                                      color: Colors.white, size: height * 0.04)
                                  :  Text("Sign In",style: GoogleFonts.poppins(
                                color: Colors.white
                              ),))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget _menuItem({String title = 'Title Menu', isActive = false}) {
  return Padding(
    padding: const EdgeInsets.only(right: 30),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Column(
        children: [
          Text(
            '$title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.green : Colors.white,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          isActive
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              : SizedBox()
        ],
      ),
    ),
  );
}

String? validateLName(String? value) {
  if (value!.isEmpty) {
    return 'Enter your last name';
  }
  return null;
}

String? validateFName(String? value) {
  if (value!.isEmpty) {
    return 'Enter your first name';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return 'Enter an email address';
  } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value!.isEmpty) {
    return 'Enter a phone number';
  } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
    return 'Enter a valid 10-digit phone number';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return 'Enter a password';
  }
  // else if (value.length < 8) {
  //   return 'Password must be at least 8 characters long';
    // } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*])[A-Za-z\d!@#\$%^&*]+$')
    //     .hasMatch(value)) {
    //   return 'Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character';
  // }
  return null;
}

String? validateHospitalName(String? value) {
  if (value!.isEmpty) {
    return 'Enter the hospital/clinic name';
  }
  return null;
}

String? validateHospitalAddress(String? value) {
  if (value!.isEmpty) {
    return 'Enter the hospital/clinic address';
  }
  return null;
}

String? validateFee(String? value) {
  if (value!.isEmpty) {
    return 'Enter the fee';
  }
  return null;
}

String? validateAbout(String? value) {
  if (value!.isEmpty) {
    return 'Enter the about';
  }
  return null;
}

Widget textField1(String hint, String counter, bool pass, bool phone, double height, double width,
    TextEditingController controller, String? Function(String?) validator) {
  return Container(
    width: width * 0.5,
    child: TextFormField(
      controller: controller,
      keyboardType: phone ? TextInputType.number : null,
      maxLength: phone ? 10 : null,
      obscureText: pass,
      validator: validator,
      decoration: InputDecoration(
        counterText: "",
        hintText: hint,
        suffixIcon: pass
            ? Icon(
                Icons.visibility_off_outlined,
                color: Colors.grey,
              )
            : null,
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
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
    ),
  );
}

void main() {
  runApp(RegisterUser());
}
