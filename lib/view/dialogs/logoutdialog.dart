import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'package:skdoosh/view/welcomescreen.dart';

import '../../colors.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  _clearSharedPref(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const WelcomeScreen();
        },
      ),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: signinpage,
      title: Column(
        children: [
          Image.asset(
            'images/warning_logo.png', // Your image asset path
            width: 40,
            height: 40,
          ),
          SizedBox(width: 10),
          Text(
            'Log Out!',
            style: TextStyle(color: Colors.white, fontFamily: "FontInter"),
          ),
        ],
      ),
      content: Text(
        'Are you sure, you want to log out',
        style: TextStyle(color: Colors.white, fontFamily: "FontInter"),
      ),
      actions: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style:
                      TextStyle(color: Colors.white, fontFamily: "FontInter"),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  _clearSharedPref(context);
                },
                child: Text(
                  'Log out',
                  style: TextStyle(color: Colors.red, fontFamily: "FontInter"),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
