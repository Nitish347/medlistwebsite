import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/dropdown.dart';
import '../home.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                  // border: Border.all(
                  //     // color: Colors.green,
                  //     ),
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
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-unknown-social-media-user-photo-default-avatar-profile-icon-vector-unknown-social-media-user-184816085.jpg",
                                    ))),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Nitish Chaurasiya',
                      style: GoogleFonts.poppins(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      'Operation Expert',
                      style: GoogleFonts.poppins(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
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
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    AboutText(height, "Fees", "1000/-"),
                    AboutText(height, "Phone No.", "8840867665"),
                    AboutText(height, "Clinic Name", "Ajay Kumar Garg Hospital"),
                    AboutText(height, "Address", "Khalilabad, Sant Kabir Nagar, UP, 272175"),
                    AboutText(height, "Education", "MBBS, Delhi Aims"),
                    AboutText(height, "About",
                        "It is a long established fact that looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
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
              child: editProfile(height, width, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget editProfile(double height, double width, BuildContext context) {
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
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.01,
          ),
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
              child: Container(width: width * 0.48, height: 50, child: Center(child: Text("Save"))),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
              style: ElevatedButton.styleFrom(
                // primary: Colors.green,
                // onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(
      String hint, String counter, bool pass, bool phone, double height, double width) {
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
