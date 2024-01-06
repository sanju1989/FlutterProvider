import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/view/home/MainScreen.dart';
import 'package:skdoosh/view/welcomescreen.dart';
import '../colors.dart';




class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _isUserExist();
  }

  _isUserExist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action1 = prefs.getString('user_id');
    debugPrint('useexist${action1}');
    if (action1 == null || action1.isEmpty) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryBg,
        child: Center(
          child: SizedBox(
            child: Image.asset(
              "images/Skdoosh_logo.png",
              width: 350,
              height: 350,
            ),
          ),
        ),
      ),
    );
  }
}
