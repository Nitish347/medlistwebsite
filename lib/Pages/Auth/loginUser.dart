import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medlistweb/Controller/SigninController.dart';
import 'package:medlistweb/Controller/authHandler.dart';
import 'package:medlistweb/Pages/Auth/registerUser.dart';
import 'package:medlistweb/Pages/Auth/verify.dart';
import 'package:medlistweb/Pages/home.dart';
import 'package:medlistweb/models/UserModel.dart';

class LoginPageUser extends StatefulWidget {
  @override
  State<LoginPageUser> createState() => _LoginPageUserState();
}

class _LoginPageUserState extends State<LoginPageUser> {
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
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: ListView(
        // padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
        children: [
          Container(
              width: double.infinity,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 50),
                child: Menu(),
              )),
          // MediaQuery.of(context).size.width >= 600 ? Menu() : SizedBox(), // Responsive
          Center(
              child: Body(
            sign: changeS,
            reg: changeR,
            register: register,
          )),

          // Center(
          //   child: Text(
          //     "© 2023 All Right Reserved",
          //     style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 13),
          //   ),
          // ),
        ],
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
              onTap: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => RegisterUser())),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Text(
                    "Register",
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
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final signinController = Get.put(SigningController());
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
              height: height * 0.2,
            ),
            Visibility(
              visible: width >= 800,
              child: Container(
                // width: width * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In to \nMy Application',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "If you don't have an account",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.008),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Text(
                          "You can",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.008),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            print(MediaQuery.of(context).size.width);
                          },
                          child: Text(
                            "Register here!",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.01),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        width >= 800 //Responsive
            ? Column(
                children: [
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Image.network(
                    "https://static.vecteezy.com/system/resources/previews/010/314/328/original/3d-character-male-doctor-illustration-png.png",
                    width: width * 0.21,
                  ),
                ],
              )
            : SizedBox(),
        Column(
          children: [
            SizedBox(
              height: width >= 800 ? height * 0.13 : height * 0.1,
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
              width: width >= 800 ? width * 0.32 : width * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: register
                      ? formRegister(height, width)
                      : _formLogin(height, width),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _formLogin(double height, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/medlist.png",
          height: height * 0.1,
        ),
        SizedBox(
          height: height * 0.04,
        ),
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: 'Email',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey[50]!),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey[50]!),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.04,
        ),
        TextField(
          controller: password,
          decoration: InputDecoration(
            hintText: 'Password',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey[50]!),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey[50]!),
              borderRadius: BorderRadius.circular(15),
            ),
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
                width: width,
                height: 50,
                child: Center(child: Text("Sign In"))),
            onPressed: () async{
             await signinController.login(email.text , password.text);
    },
            style: ElevatedButton.styleFrom(
              // primary: Colors.green,
              // onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Or continue with"),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              height: 50,
            ),
          ),
        ]),
        SizedBox(height: 10),
        Text(
          "OTP?",
          style: GoogleFonts.poppins(
              fontSize: height * 0.025, fontWeight: FontWeight.w400),
        )
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     _loginWithButton(image: 'images/google.png'),
        //     _loginWithButton(image: 'images/github.png', isActive: true),
        //     _loginWithButton(image: 'images/facebook.png'),
        //   ],
        // ),
      ],
    );
  }

  Widget _loginWithButton({String? image, bool isActive = false}) {
    return Container(
      width: 90,
      height: 70,
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  spreadRadius: 10,
                  blurRadius: 30,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey[400]!),
            ),
      child: Center(
          child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400]!,
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : BoxDecoration(),
        child: Image.asset(
          '$image',
          width: 35,
        ),
      )),
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

Widget formRegister(double height, double width) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(
        "assets/images/medlist.png",
        height: height * 0.1,
      ),
      SizedBox(
        height: height * 0.04,
      ),
      textField("Doctor's Name", "name", false, false),
      SizedBox(height: height * 0.02),
      textField("Hospital Name", "name", false, false),
      SizedBox(height: height * 0.02),
      textField("Hospital Address", "name", false, false),
      SizedBox(height: height * 0.02),
      textField("Phone No.", "name", false, true),
      SizedBox(height: height * 0.02),
      textField("Password", "name", true, false),
      SizedBox(height: height * 0.02),
      textField("Confirm Password", "name", true, false),
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
              width: width, height: 50, child: Center(child: Text("Sign In"))),
          onPressed: () => print("it's pressed"),
          style: ElevatedButton.styleFrom(
            // primary: Colors.green,
            // onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      SizedBox(height: height * 0.02),
    ],
  );
}

Widget textField(String hint, String counter, bool pass, bool phone) {
  return TextField(
    keyboardType: phone ? TextInputType.number : null,
    maxLength: phone ? 10 : null,
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
      labelStyle: TextStyle(fontSize: 12),
      contentPadding: EdgeInsets.only(left: 30),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[50]!),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[50]!),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
