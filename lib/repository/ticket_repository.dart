import 'package:skdoosh/model/ticket/TicketCategoryResponse.dart';
import 'package:skdoosh/model/ticket/ticketlist_response.dart';

import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../model/city_response.dart';
import '../model/ticket/AddTicketResponse.dart';
import '../res/app_url.dart';

class TicketRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  //fetch all tickets
  Future<TicketListResponse>fetchTicketList()async{
    try{
      dynamic response = await _apiServices.getApi(AppUrl.ticketListApi);
      return TicketListResponse.fromJson(response);
    }
    catch (e){
      throw e;
    }
  }
  //fetch ticket category
  Future<TicketCategoryResponse>fetchTicketCategory()async{
    try{
      dynamic response = await _apiServices.getApi(AppUrl.ticketCtgryApi);
      return TicketCategoryResponse.fromJson(response);
    }
    catch (e){
      throw e;
    }
  }
  Future<dynamic>addTicket(dynamic data)async{
    try{
      dynamic response = await _apiServices.postApi(data, AppUrl.addticketApi);
      return response;
    }
    catch(e){
      throw e;
    }
  }

  //ticket info
  Future<dynamic>fetchTicketInfo(String ticketId)async{
    try{
      dynamic response = await _apiServices.postApi(ticketId, AppUrl.ticketInfoApi);
      return response;
    }
    catch(e){
      throw e;
    }
  }
}