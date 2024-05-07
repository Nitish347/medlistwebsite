import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medlistweb/Controller/UserData.dart';

import '../../OBSdata.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    getData();
    super.initState();
  }
  final controller = Get.put(UserData());
  bool _loadingUser = false;
  void getData() async{
    setState(() {
      _loadingUser = true;
    });
    await controller.getUser();
    await controller.getAppointmnet();
    await controller.getAppointmnetDone();
    setState(() {
      _loadingUser = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final controller = Get.put(UserData());
    return  Container(
      alignment: Alignment.center,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         _loadingUser ? LoadingAnimationWidget.twoRotatingArc(color:Colors.green  , size: height*0.05) :  Container(
            alignment: Alignment.center,
            width: width * 0.25,
            height: height * 0.88,
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
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-unknown-social-media-user-photo-default-avatar-profile-icon-vector-unknown-social-media-user-184816085.jpg",
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    controller.userModel.value.doctorName ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.03, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  Text(
                    controller.userModel.value.specialization  ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.02, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  RatingBar.builder(
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: height * 0.03,
                    glow: true,
                    glowRadius: 20,
                    ignoreGestures: true,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  AboutText(height, "Fees", "1000/-"),
                  AboutText(height, "Phone No.", "${controller.userModel.value.phone}"),
                  AboutText(height, "Clinic Name", "${controller.userModel.value.hospitalName}"),
                  AboutText(height, "Address", "${controller.userModel.value.phone}"),
                  AboutText(height, "Education", "MBBS, Delhi Aims"),
                  AboutText(height, "About","${controller.userModel.value.about}")
                           ],
              ),
            ),
          ),
          Container(
            height: height * 0.88,
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
            width: width * 0.7,
            child: ListView(children: <Widget>[
              SizedBox(
                height: height * 0.02,
              ),
              Image.asset(
                "assets/images/medlist.png",
                height: height * 0.15,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                  child: Text(
                'Search For Patient',
                style: GoogleFonts.poppins(
                  fontSize: height * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Container(
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(30),
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.25, vertical: height * 0.02),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 0.06,
                    width: width * 0.07,
                    decoration:
                        BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Search",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: width * 0.01,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 _loadingUser ?  LoadingAnimationWidget.hexagonDots(color: Colors.green  , size: height*0.05)  :  homeInfo(height, width, "Total No. of Appointement (Today)", controller.appointmentList.length.toString()),
                  _loadingUser ?  LoadingAnimationWidget.hexagonDots(color: Colors.green  , size: height*0.05)  :  homeInfo(height, width, "Total No. of Appointement Left", controller.appointmentList.length.toString()),
                  _loadingUser ?  LoadingAnimationWidget.hexagonDots(color: Colors.green  , size: height*0.05)  :    homeInfo(height, width, "Total No. of Appointement Done", controller.appointmentDoneList.length.toString()),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}

Widget AboutText(double height, String title, String desc) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title : ',
          style: GoogleFonts.poppins(
              fontSize: height * 0.02, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            desc,
            style: GoogleFonts.poppins(
                fontSize: height * 0.018, fontWeight: FontWeight.w300, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget homeInfo(double height, double width, String label, String data) {
  return Container(
    height: height * 0.2,
    width: width * 0.15,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            blurRadius: 10.0,
          ),
          BoxShadow(
              color: Colors.black.withOpacity(0.4), offset: Offset(4.0, 4.0), blurRadius: 10.0)
        ],
        borderRadius: BorderRadius.circular(8)),
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: height * 0.023,
            fontWeight: FontWeight.w500,
          ),
        )),
        Center(
            child: Text(
          data,
          style: GoogleFonts.poppins(
            fontSize: height * 0.04,
            fontWeight: FontWeight.w500,
          ),
        )),
      ],
    ),
  );
}
