import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Widget dropDown(String label, String PlaceHolder, String Controller, List<DropDownValueModel> ls,
//     double width, SingleValueDropDownController cntrl) {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     child: Expanded(
//       child: Container(
//         width: width,
//         child: DropDownTextField(
//           // initialValue: "name4",
//           controller: cntrl,
//           clearOption: true,
//           // enableSearch: true,
//           // dropdownColor: Colors.green,
//           textFieldDecoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Color(0xff002395), width: 1)),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: Color(0xff002395),
//                 width: 1.0,
//               ),
//             ),
//             contentPadding: EdgeInsets.only(bottom: 3, left: 20),
//             labelText: label,
//             labelStyle: GoogleFonts.poppins(color: Color(0xff002395)),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: PlaceHolder,
//             hintStyle: TextStyle(
//               fontSize: 16,
//               color: Colors.black,
//             ),
//           ),
//           validator: (value) {
//             if (value == null) {
//               return "Required field";
//             } else {
//               return null;
//             }
//           },
//           dropDownItemCount: 6,
//
//           dropDownList: ls,
//           onChanged: (val) {
//             setState(() {
//               Controller = val.toString();
//             });
//           },
//         ),
//       ),
//     ),
//   );
// }
