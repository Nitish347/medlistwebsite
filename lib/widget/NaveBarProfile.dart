import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medlistweb/Pages/Auth/LoginPage.dart';
import 'package:medlistweb/Pages/HomeScreen/EditProfile.dart';

Widget profileDropDown(BuildContext context, double height, double width) {
  return DropdownButtonHideUnderline(
    child: DropdownButton2(
      customButton: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-unknown-social-media-user-photo-default-avatar-profile-icon-vector-unknown-social-media-user-184816085.jpg",
        ),
      ),
      items: [
        ...MenuItems.firstItems.map(
          (item) => DropdownMenuItem<MenuItem>(
            value: item,
            child: InkWell(
                onTap: () {
                  if (item.text == "Edit Profile") {
                    Navigator.push(
                        context, CupertinoPageRoute(builder: (context) => EditProfile()));
                  }
                },
                child: MenuItems.buildItem(item, context)),
          ),
        ),
        const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
        ...MenuItems.secondItems.map(
          (item) => DropdownMenuItem<MenuItem>(
            value: item,
            child: InkWell(
                onTap: ()async{
                  await FirebaseAuth.instance.signOut();
                  // Get.to(()=>LoginPage());
                },
                child: MenuItems.buildItem(item, context)),
          ),
        ),
      ],
      onChanged: (value) {
        MenuItems.onChanged(context, value! as MenuItem);
      },
      dropdownStyleData: DropdownStyleData(
        width: width * 0.1,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        offset: const Offset(0, 8),
      ),
      menuItemStyleData: MenuItemStyleData(
        customHeights: [
          ...List<double>.filled(MenuItems.firstItems.length, 48),
          8,
          ...List<double>.filled(MenuItems.secondItems.length, 48),
        ],
        padding: const EdgeInsets.only(left: 16, right: 16),
      ),
    ),
  );
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [edit, dashboard, history];
  static const List<MenuItem> secondItems = [logout];

  static const edit = MenuItem(text: 'Edit Profile', icon: Icons.person);
  static const dashboard = MenuItem(text: 'Dashboard', icon: Icons.dashboard_outlined);
  static const history = MenuItem(text: 'History', icon: Icons.watch_later_outlined);

  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item, BuildContext context) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.green, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.edit:
        break;
      case MenuItems.dashboard:
        break;
      case MenuItems.history:
        break;
      case MenuItems.logout:
        //Do something
        break;
    }
  }
}
