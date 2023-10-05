import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medlistweb/Constants/Constants.dart';

Widget Requests(double width, double height) {
  return Column(
    children: [
      Text(
        'Requests',
        style: GoogleFonts.poppins(
            fontSize: height * 0.04, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      SizedBox(
        height: height * 0.02,
      ),
      SizedBox(
          height: height * 0.8,
          width: width * 0.4,
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return RequestCard(width, height, "Shivika Tyagi", "Accept", "8840867665",
                    "svgPath", Colors.green, "Address", "12/05/2003");
              })),
    ],
  );
}

Widget RequestCard(
  double width,
  double heigth,
  String title,
  String buttonText,
  String id,
  String svgPath,
  Color color,
  String value,
  String date,
) {
  return Padding(
    padding: EdgeInsets.only(top: heigth * 0.015, left: 5, right: 5),
    child: Container(
        width: width,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.green,
          )
        ]),
        child: Padding(
          padding: EdgeInsets.all(heigth * 0.016),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // height: heigth * 0.07,
                      child: CircleAvatar(
                          radius: heigth * 0.03,
                          backgroundImage: NetworkImage(
                              "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-unknown-social-media-user-photo-default-avatar-profile-icon-vector-unknown-social-media-user-184816085.jpg")),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.poppins(
                                  color: Color(0xff25262C), fontSize: heigth * 0.019),
                            ),
                          ],
                        ),
                        Text(
                          "$id",
                          style: TextStyle(color: Color(0xff25262C), fontSize: heigth * 0.015),
                        ),
                        Text(
                          "$value",
                          style: TextStyle(color: Color(0xff25262C), fontSize: heigth * 0.018),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: heigth * 0.035,
                        width: heigth * 0.11,
                        decoration: BoxDecoration(
                            color: Colors.red, borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Reject",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: heigth * 0.016,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: heigth * 0.035,
                        width: heigth * 0.11,
                        decoration:
                            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          buttonText,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: heigth * 0.016,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    // DateFormat('dd/MM/yy').format(DateTime.parse(date)),
                    date,
                    style: TextStyle(color: Color(0xff25262C), fontSize: heigth * 0.018),
                  )
                ],
              )
            ],
          ),
        )),
  );
}
