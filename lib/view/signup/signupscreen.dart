import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/res/component/RoundButton.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'package:skdoosh/utils/Utils.dart';

import 'package:skdoosh/view/otp/otpscreen.dart';
import 'package:skdoosh/view/signup/widget/SignupInputEmailWidget.dart';
import 'package:skdoosh/view/signup/widget/SignupInputFullNameWidget.dart';
import 'package:skdoosh/view/signup/widget/SignupInputPhoneNumberWidget.dart';
import 'package:skdoosh/view/webview/termscondition.dart';
import 'package:skdoosh/view_models/controller/signup/signup_view_model.dart';

import '../../view_models/AuthViewModel.dart';
import '../home/MainScreen.dart';
import '../venue/venuescreen.dart';

class Signupscreen extends StatefulWidget {
   Signupscreen(this.user_role, {super.key});

   final String user_role;

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final signupVM = Get.put(SingupViewModel());
  final _formkey = GlobalKey<FormState>();

  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isChecked = false;

  String deviceId='';
  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

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
              Navigator.pop(context);
            },
            icon:
            const Icon(Icons.arrow_back, color: Colors.white, size: 40.0)),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontFamily: "Inter", fontSize: 30),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Lorem Ipsum Is Simply Dummy Text of The Printing And Typesetting Industry.",
                      style: TextStyle(
                          fontFamily: "Inter", color: lorem, fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    height: 50,
                    // child: SignupInputFullNameWidget(),
                    child: TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full Name',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Email address cannot be empty';
                      //   }
                      //   if (!_emailRegex.hasMatch(value)) {
                      //     return 'Email address is not valid';
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    height: 50,
                    // child: SignupInputPhoneNumberWidget(),

                    child: TextFormField(
                      controller: phoneNoController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                        counterText: ''
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Phone number cannot be empty';
                      //   }
                      //   if (!_phoneRegex.hasMatch(value)) {
                      //     return 'Phone number is not valid';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    height: 50,
                    //child: SignupInputEmailWidget(),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 25),
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(25),
                  //   ),
                  //   width: double.infinity,
                  //   height: 50,
                  //   child: TextField(
                  //     // controller: emailcontroller,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       hintText: 'Re-enter email',
                  //     ),
                  //     keyboardType: TextInputType.text,
                  //   ),
                  // ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: Container(
                                child: isChecked
                                    ? Icon(Icons.check_box, color: Colors.green)
                                    : Icon(Icons.check_box_outline_blank),
                              ),
                            ),
                            // Icon(Icons.check_box_outline_blank),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text.rich(
                                TextSpan(
                                  text: 'I agree to ',
                                  style: TextStyle(fontSize: 15),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'terms & conditions',
                                      style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          abc();
                                          // //Navigate to the next screen when the user taps on 'terms & conditions'.
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           TermsCondition()),
                                          // );
                                          //Get.toNamed(
                                          //    RouteName.termsConditionScreen);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  RoundButton(
                      title: 'Continue',
                      loading: authViewModel.signUpLoading,
                      onPress: () {
                        debugPrint(isChecked.toString());
                        if (fullNameController.text.isEmpty) {
                          Utility.snackBar('Required this field',context);
                        } else if (phoneNoController.text.isEmpty) {
                          Utility.snackBar('Required this field',context);
                        } else if (emailController.text.isEmpty) {
                          Utility.snackBar('Required this field',context);
                          // } else if (_emailRegex.hasMatch(emailController.text)) {
                          //  Utility.snackBar('Email', 'Email is not valid');
                        }
                        else if(!isChecked){
                          Utility.snackBar('Please tick term & condition',context);
                        }
                        else {
                          Map data = {
                            'user_role':widget.user_role,
                            'user_name':fullNameController.text,
                            'user_phone': phoneNoController.text,
                            'device_token': deviceId,
                            'user_email':emailController.text.toString(),
                            'otp_type':'signup'
                          };
                          authViewModel.otpGenerateApi(data,true, context);
                        }
                        print('api hit');
                      }),
                  /*Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            debugPrint("inside if onpress");
                            Get.toNamed(RouteName.venuScreen);
                            signupVM.loginApi();
                          } else {
                            debugPrint("inside else");
                          }
                          //signupVM.loginApi();
                          //Get.toNamed(RouteName.venuScreen);
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                      )),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void abc() async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TermsCondition(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      print(result);
      //text = result;
      isChecked=result;
    });
  }
}
