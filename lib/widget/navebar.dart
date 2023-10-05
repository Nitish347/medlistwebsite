// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:medloastweb/Pages/HomeScreen/appointments.dart';
//
// import '../Pages/Auth/loginUser.dart';
//
// class NaveBar extends StatefulWidget {
//   @override
//   State<NaveBar> createState() => _NaveBarState();
// }
//
// class _NaveBarState extends State<NaveBar> {
//   int index = 0;
//   changeIndex(int num) {
//     setState(() {
//       index = num;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Container(
//             width: MediaQuery.of(context).size.width,
//             color: Colors.green,
//             child: Padding(
//               padding: EdgeInsets.only(
//                   top: size.height * 0.02, bottom: size.height * 0.01, left: size.width * 0.1),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             changeIndex(0);
//                           },
//                           child: _menuItem('Home', index == 0, size.width)),
//                       InkWell(
//                           onTap: () {
//                             changeIndex(1);
//                           },
//                           child: _menuItem('Appointments', index == 1, size.width)),
//                       InkWell(
//                           onTap: () {
//                             changeIndex(2);
//                           },
//                           child: _menuItem('OverView', index == 2, size.width)),
//                       InkWell(
//                           onTap: () {
//                             changeIndex(3);
//                           },
//                           child: _menuItem('Help', index == 3, size.width)),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(right: size.width * 0.1),
//                     child: InkWell(
//                       onTap: () => Navigator.push(
//                           context, CupertinoPageRoute(builder: (context) => LoginPageUser())),
//                       child: CircleAvatar(
//                         backgroundImage: NetworkImage(
//                           "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-unknown-social-media-user-photo-default-avatar-profile-icon-vector-unknown-social-media-user-184816085.jpg",
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//         // Appointments()
//       ],
//     );
//   }
// }
//
//
