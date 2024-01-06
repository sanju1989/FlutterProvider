

import 'package:skdoosh/data/network/base_api_service.dart';
import 'package:skdoosh/data/network/network_api_service.dart';

import '../res/app_url.dart';

class HomeRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> homeApi(dynamic user_id) async {
    try {
      dynamic response = await _apiServices.getApi(AppUrl.homedashboardApi);
      return response;
    } catch (e) {
      throw e;
    }
  }

}