
import 'package:skdoosh/data/network/base_api_service.dart';
import 'package:skdoosh/data/network/network_api_service.dart';

import '../model/employee_response.dart';
import '../res/app_url.dart';

class EmployeeRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  Future<EmployeeTypeResponse>fetchTicketCategory()async{
    try{
      dynamic response = await _apiServices.getApi(AppUrl.employeetypeAPI);
      return EmployeeTypeResponse.fromJson(response);
    }
    catch (e){
      throw e;
    }
  }
}