import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/res/routes/routes_name.dart';


import '../../colors.dart';
import '../../view_models/AuthViewModel.dart';

class Otpscreen extends StatefulWidget {
   Otpscreen(this.user_role,this.user_name,this.user_phone,this.device_token,this.user_email,this.otp_type, {super.key});
   final String user_role;
   final String user_name;
   final String user_phone;
   final String device_token;
   final String user_email;
   final String otp_type;
   //final String otp_code;
  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {

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
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
                size: 40.0
            )
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Text(widget.otp_code.toString()),
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
                  child: Text("To verify your phone number kindly enter the OTP received on your number ${widget.user_phone}",
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
                    print(verificationCode);
                    setState(() {
                      clearText = true;
                    });

                    if(widget.otp_type=='signup'){
                      Map data = {
                        'user_role':widget.user_role,
                        'user_name':widget.user_name,
                        'user_phone': widget.user_phone,
                        'device_token': widget.device_token,
                        'otp':verificationCode,
                        'user_email':widget.user_email,
                      };
                      //true- screen will redirect
                      authViewModel.verifyOtp(data,true, context);
                    }
                    else{
                      Map data = {
                        'user_phone': widget.user_phone,
                        'device_token': widget.device_token,
                        'otp':verificationCode,
                      };
                      authViewModel.loginApi(data, context);
                    }

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Homescreen1()),
                    // );
                   // Get.toNamed(RouteName.mainScreen);
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
                    if(widget.otp_type=='signup') {
                      Map data = {
                        'user_role': widget.user_role,
                        'user_name': widget.user_name,
                        'user_phone': widget.user_phone,
                        'device_token': widget.device_token,
                        'user_email': widget.user_email,
                        'otp_type': 'signup'
                      };
                      //false = flag to stop screen recreate
                      authViewModel.otpGenerateApi(data,false, context);
                    }
                    else{
                      Map data = {
                        'user_role':'null',
                        'user_name':'null',
                        'user_phone': widget.user_phone,
                        'device_token': widget.device_token,
                        'user_email':'abac',
                        'otp_type':'login'
                      };
                      //false = flag to stop screen recreate
                      authViewModel.otpGenerateApi(data,false, context);
                    }
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