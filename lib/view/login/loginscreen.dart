import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/res/component/RoundButton.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'package:skdoosh/view/login/widget/InputPhoneNumberWidget.dart';
import 'package:skdoosh/view_models/controller/signin/login_view_model.dart';

import '../../utils/Utils.dart';
import '../../view_models/AuthViewModel.dart';
import '../otp/otpscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNoController = TextEditingController();
  String deviceId='';
  @override
  void initState() {
    super.initState();
    _getDeviceID();
  }
  Future<void> _getDeviceID() async {
    var deviceInfo = DeviceInfoPlugin();
    //if (Platform.) { // import 'dart:io'
    //  var iosDeviceInfo = await deviceInfo.iosInfo;
    //  iosDeviceInfo.identifierForVendor; // unique ID on iOS
    // } else if(Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    deviceId=androidDeviceInfo.androidId.toString(); // unique ID on Android
    print(deviceId);
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString('deviceId', androidDeviceInfo.androidId.toString());

    print('pref${preferences.getString('deviceId')}');
  }
  // Future<void> saveUserId(String userId) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString('userID', userId);
  // }


  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: signinpage,
      appBar: AppBar(
        backgroundColor: signinpage,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_outlined,
                color: Colors.white, size: 30.0)),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "images/Skdoosh_logo1.png",
                height: 50,
                width: 80,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                      fontFamily: "FontInter",
                      color: AppColor.black303030,
                      fontSize: 27),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  "Lorem Ipsum Is Simply Dummy Text of The Printing And Typesetting Industry.",
                  style: TextStyle(
                      fontFamily: "FontInter", color: lorem, fontSize: 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 50,
               // child: InputPhoneNumberWidget(),
                child: TextField(
                  controller: phoneNoController,
                  style: const TextStyle(fontSize: 16,color: AppColor.black303030),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your mobile number',
                    counterText: ''
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                ),
              ),
              RoundButton(
                  title: 'Generate Otp',
                  loading: authViewModel.signUpLoading,
                  onPress: () {
                    if(phoneNoController.text.isEmpty){
                      Utility.snackBar('Required this field',context);
                    }
                    else if(phoneNoController.text.length<10){
                      Utility.snackBar('Number is not valid',context);
                    }
                    else{
                      Map data = {
                        'user_role':'null',
                        'user_name':'null',
                        'user_phone': phoneNoController.text,
                        'device_token': deviceId,
                        'user_email':'abac',
                        'otp_type':'login'
                      };
                      //true falg== redirect to otp screen
                      authViewModel.otpGenerateApi(data,true, context);
                    }
                  }
              )
              /*Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      loginVM.loginApi();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: const Text(
                      "GENERATE OTP",
                      style: TextStyle(
                          fontFamily: 'FontInter', color: Colors.white),
                    ),
                  )
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
