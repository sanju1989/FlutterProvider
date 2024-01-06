import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'dart:ui';

import '../../colors.dart';
import '../contacts/contactscreen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 320, top: 40, right: 120),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
          topRight: Radius.circular(80),
        ),
        child: SizedBox(
          // width: 250,
          child: Drawer(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: drawercolor),
              child: new ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: searchcolor),
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: iconsearchcolor,
                          ),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: iconsearchcolor),
                          hintText: "Search"),
                    ),
                  ),
                  new ListTile(
                    title: new Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Get.toNamed(RouteName.newprofile);
                      Navigator.pop(context);
                    },
                    leading: new ImageIcon(
                      AssetImage("images/profile.png"),
                      color: Colors.white,
                    ),
                  ),
                  new ListTile(
                    title: new Text(
                      'Staff',
                      style: TextStyle(
                        fontSize: 15.0,
                        // fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      Get.toNamed(RouteName.staffScreen);
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    leading: new ImageIcon(
                      AssetImage("images/staff.png"),
                      color: Colors.white,
                    ),
                  ),

                  new ListTile(
                    title: new Text(
                      'Contacts',
                      style: TextStyle(
                        fontSize: 15.0,
                        // fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Get.toNamed(RouteName.staffScreen);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactScreen()));
                      // Then close the drawer
                      //Navigator.pop(context);
                    },
                    leading: new ImageIcon(
                      AssetImage("images/contactslogo.png"),
                      color: Colors.white,
                    ),
                  ),
                  new ListTile(
                    title: new Text(
                      'Calendar',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      Get.toNamed(RouteName.calendarScreen);
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    leading: new ImageIcon(
                      AssetImage("images/calendar.png"),
                      color: Colors.white,
                    ),
                  ),
                  new ListTile(
                    title: new Text(
                      'Analytics',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    leading: new ImageIcon(
                      AssetImage("images/analytics.png"),
                      color: Colors.white,
                    ),
                  ),
                  // new Divider(
                  //   color: Colors.black38,
                  // ),
                  new ListTile(
                    title: new Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed(RouteName.settingScreen);
                    },
                    leading: new ImageIcon(
                      AssetImage("images/Settings_logo.png"),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


