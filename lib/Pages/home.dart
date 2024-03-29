import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlistweb/widget/Requests.dart';

import '../widget/NaveBarProfile.dart';
import '../widget/navebar.dart';
import 'Auth/loginUser.dart';
import 'HomeScreen/Home.dart';
import 'HomeScreen/appointments.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  changeIndex(int num) {
    setState(() {
      index = num;
    });
  }

  showDataAlert(double height, double widht) {
    bool sent = false;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.only(
                top: 10.0,
              ),
              content: Requests(widht, height));
        });
  }

  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    List tabs = [
      HomeScreenBody(),
      Appointment(height, width, context),
      Center(
        child: Text("2"),
      ),
      Center(
        child: Text("3"),
      ),
    ];
    return Scaffold(
        body: Stack(
      children: [
        Positioned(top: 70, child: tabs[index]),
        Positioned(
          top: 0,
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.02,
                        bottom: size.height * 0.01,
                        left: size.width * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  changeIndex(0);
                                },
                                child: _menuItem('Home', index == 0, size.width)),
                            InkWell(
                                onTap: () {
                                  changeIndex(1);
                                },
                                child: _menuItem('Appointments', index == 1, size.width)),
                            InkWell(
                                onTap: () {
                                  changeIndex(2);
                                },
                                child: _menuItem('OverView', index == 2, size.width)),
                            InkWell(
                                onTap: () {
                                  changeIndex(3);
                                },
                                child: _menuItem('Help', index == 3, size.width)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.1),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    showDataAlert(height, width);
                                  },
                                  child: Icon(
                                    CupertinoIcons.bell,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              profileDropDown(context, height, width)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              // Appointments()
            ],
          ),
        ),
      ],
    ));
  }
}

Widget _menuItem(String title, bool isActive, double width) {
  return Padding(
    padding: EdgeInsets.only(right: width * 0),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: isActive ? Colors.white : Colors.green),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            '$title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.green : Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
