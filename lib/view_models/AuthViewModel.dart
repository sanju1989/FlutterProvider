import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/model/otp_response.dart';
import 'package:skdoosh/utils/SharedPref.dart';
import 'package:skdoosh/utils/Utils.dart';
import 'package:skdoosh/view/home/HomeScreen2.dart';
import 'package:skdoosh/view/home/MainScreen.dart';
import 'package:skdoosh/view/otp/otpscreen.dart';
import 'package:skdoosh/view/venue/veribusinesskyc.dart';

import '../data/response/api_response.dart';
import '../repository/AuthRepository.dart';
import '../utils/calendar/date_utils.dart';
import '../view/home/homebackup.dart';
import '../view/otp/signupotp.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _signUpLoading = false;

  bool get signUpLoading => _signUpLoading;

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  ApiResponse<OtpResponse> otpResponse = ApiResponse.loading();

  // Future<void> saveUserId(String userId) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString('userID', userId);
  // }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _authRepo.signupApi(data).then((value) {
      setSignUpLoading(false);

      Utility.snackBar('SignUp Successfully', context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerifyBusinessKyc(data['user_role'])),
      );
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utility.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _authRepo.loginApi(data).then((value) {
      setSignUpLoading(false);

      if (kDebugMode) {
        print(value.error);
      }

      if (value.success == true) {
        Utility.snackBar('Login Successfully',context);
        debugPrint(value.data?.first.businessId.toString());
        SharedPref sharedPref = SharedPref();
        debugPrint('username:${value.data?.first.userName.toString()}');
        sharedPref.save('user_id', value.data?.first.userId.toString());
        sharedPref.save('user_name', value.data?.first.userName.toString());
        sharedPref.save('user_phone', value.data?.first.userPhone.toString());
        sharedPref.save('user_email', value.data?.first.userEmail.toString());
        sharedPref.save('business_id', value.data?.first.businessId.toString());
        sharedPref.save('business_name', value.data?.first.businessName.toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        Utility.snackBar('value.error.toString()', context);
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utility.snackBar(error.toString(), context);
      if (kDebugMode) {
        print('==${error.toString()}');
        print('stack$stackTrace');
      }
    });
  }

  //login api login with phone number
  Future<void> otpGenerateApi(
      dynamic data1, bool isRedirect, BuildContext context) async {
    setSignUpLoading(true);
    Map data = {
      'user_phone': data1['user_phone'],
      'device_token': data1['device_token'],
    };

    _authRepo.otpGenerateApi(data).then((value) {
      setSignUpLoading(false);
      print('object${value.success}');

      if (kDebugMode) {
        print(value.toString());
      }
      if (value.success == true) {
        Utility.snackBar(value.message.toString(), context);
        Utility.snackBar(value.data.toString(), context);
        if (isRedirect) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Otpscreen(
                      data1['user_role'],
                      data1['user_name'],
                      data1['user_phone'],
                      data1['device_token'],
                      data1['user_email'],
                      //value.data.toString(),
                      data1['otp_type'])));
        }
      } else {
        Utility.snackBar(value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utility.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  //otp verify
  Future<void> verifyOtp(
      dynamic data, bool isRedirect, BuildContext context) async {
    setSignUpLoading(true);
    _authRepo.verifyOtp(data).then((value) {
      setSignUpLoading(false);

      if (kDebugMode) {
        print(value.toString());
      }
      if (value.success == true) {
        Utility.snackBar(value.message.toString(), context);
        Utility.snackBar(value.data.toString(), context);
        //is Redirect - false-case: screen will redirect | true case: screen will not redirect
        if (isRedirect) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignupOtp(
                        data['user_role'],
                        data['user_name'],
                        data['user_phone'],
                        data['device_token'],
                        data['user_email'],
                        data['otp'],
                      )));
        }
      } else {
        Utility.snackBar('error', context);
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utility.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}