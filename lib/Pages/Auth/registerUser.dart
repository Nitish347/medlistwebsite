import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


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

                    // Center(
                    //   child: Text(
                    //     "© 2023 All Right Reserved",
                    //     style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 13),
                    //   ),
                    // ),
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

class Body extends StatelessWidget {
  Function reg;
  Function sign;
  bool register;
  Body({required this.reg, required this.sign, required this.register});
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
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: formRegister(height, width, context)),
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

Widget _registerButton(String text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[200]!,
          spreadRadius: 10,
          blurRadius: 12,
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    ),
  );
}

Widget formRegister(double height, double width, BuildContext context) {
  List<String> genderOptions = ['Select Gender', 'Male', 'Female', 'Other'];
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
  String selectedGender = 'Select Gender';
  return Row(
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
                  textField("First Name", "name", false, false, height, width / 2.1),
                  textField("Last Name", "name", false, false, height, width / 2.1),
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
                  textField("Email", "name", false, false, height, width / 2.1),
                  textField("Phone Number", "name", false, false, height, width / 2.1),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            textField("Hospital/Clinic Name", "name", false, false, height, width),
            SizedBox(height: height * 0.02),
            textField("Hospital/Clinic Address", "name", false, false, height, width),
            SizedBox(height: height * 0.02),
            Container(
              width: width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dropdown(genderOptions, "Gender", width),
                  dropdown(doctorSpecializations, "Specialization", width),
                  textField("Appointment Fee Rs.", "name", false, false, height, width * 0.4),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            textField("About", "name", false, false, height, width),
            SizedBox(height: height * 0.02),
            Container(
              width: width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textField("Password", "name", true, false, height, width / 2.1),
                  textField("Confirm Password", "name", true, false, height, width / 2.1),
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
                child: Container(
                    width: width * 0.48, height: 50, child: Center(child: Text("Sign In"))),
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget textField(String hint, String counter, bool pass, bool phone, double height, double width) {
  return Container(
    width: width * 0.5,
    child: TextField(
      keyboardType: phone ? TextInputType.number : null,
      maxLength: phone ? 10 : null,
      obscureText: pass,
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
      ),
    ),
  );
}

void main() {
  runApp(RegisterUser());
}
