import 'package:skdoosh/model/event/event_duration_response.dart';
import 'package:skdoosh/model/event/event_frequency_response.dart';
import 'package:skdoosh/model/event/event_type_response.dart';
import 'package:skdoosh/model/venue/venue_response.dart';

import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../res/app_url.dart';

class EventRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  //fetch events duration
  Future<EventDurationResponse> fetchDuration() async {
    try {
      dynamic response = await _apiServices.getApi(AppUrl.eventDurationApi);
      print('repo$response');
      return EventDurationResponse.fromJson(response);
    } catch (e) {
      print('++$e');
      throw e;
    }
  }

  //fetch events duration
  Future<EventFrequencyResponse> fetchFrequency() async {
    try {
      dynamic response = await _apiServices.getApi(AppUrl.eventFrequency);
      print('repo$response');
      return EventFrequencyResponse.fromJson(response);
    } catch (e) {
      print('++$e');
      throw e;
    }
  }

  //fetch events type list
  Future<EventTypeResponse> fetchEventType() async {
    try {
      dynamic response = await _apiServices.getApi(AppUrl.eventTypeApi);
      print('repo$response');
      return EventTypeResponse.fromJson(response);
    } catch (e) {
      print('++$e');
      throw e;
    }
  }
  //fetch venue type list
  Future<VenueResponse> fetchVenueList(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApi(data, AppUrl.fetchVenueApi);
      print('repo$response');
      return VenueResponse.fromJson(response);
    } catch (e) {
      print('++$e');
      throw e;
    }
  }

  //event info api
  Future<dynamic>eventInfoApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.postApi(data, AppUrl.eventInfoApi);
      return response;
    }
    catch(e){
      throw e;
    }
  }
}