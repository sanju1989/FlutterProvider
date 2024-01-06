import 'dart:ui';
import 'package:skdoosh/data/network/network_api_service.dart';
import 'package:skdoosh/res/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> otpGenerateApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}
