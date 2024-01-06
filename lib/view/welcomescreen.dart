import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/view/signup/signupscreen.dart';
import 'package:skdoosh/view/venue/identityscreen.dart';
import 'package:skdoosh/view/venue/venuescreen.dart';

import '../res/app_color.dart';
import '../res/routes/routes_name.dart';
import 'login/loginscreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      body: Container(
        margin: EdgeInsets.only(top: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SizedBox(
                child: Image.asset(
                  "images/Skdoosh_logo1.png",
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              child: Center(
                child: Image.asset("images/Skdoosh_rotate.png"),
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Welcome,",
                        style: TextStyle(
                            fontSize: 27, color: AppColor.black303030,
                            fontFamily: "FontInter",
                        fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Lorem Ipsum Is Simply Dummy Text of The Printing And Typesetting Industry Lorem Ipsum Is Simply Dummy Text of The Printing And Typesetting Industry ",
                        style: TextStyle(fontSize: 15, color: welcomecolor),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(RouteName.loginScreen);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => LoginScreen()),
                                  // );
                                  // Handle button 1 press
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: signincolor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                                child: Text(
                                  'SIGN IN',

                                  style: TextStyle(fontSize: 12, fontFamily: 'FontIner', color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () {
                                //  Get.toNamed(RouteName.signupScreen);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IdentityScreen()),
                                  );
                                },
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(fontFamily: 'FontIner',fontSize: 12),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: singupcolor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
