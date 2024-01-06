
import 'package:skdoosh/data/network/network_api_service.dart';
import 'package:skdoosh/res/app_url.dart';

class SignupRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> signupApi(var data)async{
    dynamic response= await _apiService.postApi(data, AppUrl.signupApi);
    return response;
  }
}