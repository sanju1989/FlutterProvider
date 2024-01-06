import 'package:flutter/cupertino.dart';
import 'package:skdoosh/model/profileinfo_response.dart';

import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../res/app_url.dart';

class ProfileRepository with ChangeNotifier{
  BaseApiServices _apiServices = NetworkApiServices();

  Future<ProfileInfoResponse> fetchProfileInfo(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApi(data, AppUrl.getUserInfoApi);
      return ProfileInfoResponse.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}