import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlistweb/FirestoreMethod/Fetch_Data.dart';

import '../../OBSdata.dart';

class Labs extends StatefulWidget {
  const Labs({Key? key}) : super(key: key);

  @override
  State<Labs> createState() => _LabsState();
}

class _LabsState extends State<Labs> {
  bool  _loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  getData()async{
    setState(() {
      _loading = true;
    });

    await Fetch.fetchUser(auth.currentUser!.uid);
    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    getData();

    // TODO: implement initState

  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final controller = Get.put(ObsData());
    return  _loading ? const Center(child: CircularProgressIndicator(),)  :   Container(
      alignment: Alignment.center,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

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
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.3),
              child: Container(
                height: height*0.1,
                width: height*0.1,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.upload),
              ),
            ),
              Center(child: Text("Upload Report"))
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
        // border: Border.all(
        //     // color: Colors.green,
        //     ),
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
