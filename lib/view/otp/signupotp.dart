import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:skdoosh/res/routes/routes_name.dart';


import '../../colors.dart';
import '../../res/app_color.dart';
import '../../view_models/AuthViewModel.dart';
import '../home/MainScreen.dart';
class SignupOtp extends StatefulWidget {
  SignupOtp(this.user_role,this.user_name,this.user_phone,this.device_token,this.user_email,this.otp_code, {super.key});
  final String user_role;
  final String user_name;
  final String user_phone;
  final String device_token;
  final String user_email;
  final String otp_code;

  @override
  State<SignupOtp> createState() => _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {
  TextEditingController emailcontroller = TextEditingController();
  int numberOfFields = 6;
  bool clearText = false;
  late List<TextStyle?> otpTextStyles;
  late List<TextEditingController?> controls;
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 40;
  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: primaryBg,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40.0
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/Skdoosh_logo1.png",
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 100,
                child: Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(top: 40),
                  child: Text("Enter the code #1", style: TextStyle(fontFamily: "Inter", fontSize: 30, color: Colors.white),),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 40,left: 40),
                  // margin: EdgeInsets.only(top: 10,),
                  child: Text("To verify your Email id kindly enter the OTP received on your email id: ",
                    style: TextStyle(color: Colors.white),)
              ),
              OtpTextField(
                numberOfFields: numberOfFields,
                borderColor: Color(0xFF512DA8),
                focusedBorderColor: Color.fromARGB(255, 244, 217, 240),
                clearText: clearText,
                showFieldAsBox: false,
                textStyle: TextStyle(fontStyle: FontStyle.normal,fontSize: 30),
                onCodeChanged: (String value) {
                  //Handle each value
                },
                handleControllers: (controllers) {
                  //get all textFields controller, if needed
                  controls = controllers;
                },
                onSubmit: (String verificationCode) {
                  //set clear text to clear text from all fields
                  setState(() {
                    clearText = true;
                  });
                  Map data = {
                    'user_name':widget.user_name,
                    'user_phone': widget.user_phone,
                    'device_token': widget.device_token,
                    'otp':verificationCode,
                    'user_email':widget.user_email,
                    'user_role':widget.user_role
                  };
                  authViewModel.signupApi(data, context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Homescreen1()),
                  // );
                  // Get.toNamed(RouteName.venuScreen);
                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return AlertDialog(
                  //       title: Text("Verification Code"),
                  //       content: Text('Code entered is $verificationCode'),
                  //     );
                  //   },
                  // );
                }, // end onSubmit
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 40),
                child: currentSeconds >= timerMaxSeconds
                    ? TextButton(onPressed: (){
                  Map data = {
                    'user_role':widget.user_role,
                    'user_name':widget.user_name,
                    'user_phone': widget.user_phone,
                    'device_token': widget.device_token,
                    'otp':widget.otp_code,
                    'user_email':widget.user_email,
                  };
                  //false flag- to stop screen redirect in viewmodel
                  authViewModel.verifyOtp(data,false, context);
                  startTimeout();

                }, child: Text("Resend Otp", style: TextStyle(
                    fontFamily: "FontInter", color: AppColor.colorblack
                ),)) :
                Text("Send code again $timerText",
                  style: TextStyle(fontFamily: "Inter",color: Colors.black),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}