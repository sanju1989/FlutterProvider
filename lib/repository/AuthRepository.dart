import 'dart:convert';

import 'package:skdoosh/data/network/base_api_service.dart';
import 'package:skdoosh/data/network/network_api_service.dart';
import 'package:skdoosh/model/login_response.dart';
import 'package:skdoosh/model/otp_response.dart';
import 'package:skdoosh/res/app_url.dart';
import 'package:http/http.dart' as http;
import '../data/app_exception.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApi(data, AppUrl.signupApi);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<LoginResponse> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApi(data, AppUrl.loginApi);
      print('repo$response');
      return LoginResponse.fromJson(response);
    } catch (e) {
      print('++$e');
      throw e;
    }
  }

  //login api- login with phone
  Future<OtpResponse> otpGenerateApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApi(data, AppUrl.otpGenerate);
      print('33232$response');
      return OtpResponse.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  //verify otp
  Future<OtpResponse> verifyOtp(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApi(data, AppUrl.otpVerifyApi);
      return OtpResponse.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}