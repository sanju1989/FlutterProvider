import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../res/routes/routes_name.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: primaryBg,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40.0,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              "images/Skdoosh_logo1.png",
              height: 80,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 50,
              child: Container(
                alignment: Alignment.center,
                // margin: EdgeInsets.only(top: 40),
                child: Text(
                  "Terms & Conditions",
                  style: TextStyle(
                      fontFamily: "Inter", fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10),
                child: WebViewWidget(
                  controller: controller,
                ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.only(top: 40,right: 30,left: 30),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Get.toNamed(RouteName.signupScreen);
                  },
                  child: Text(
                    "I agree to the terms & conditions",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                )
            ),
          ),
        ],
      ),
    );
  }
}
