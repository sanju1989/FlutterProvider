import 'package:flutter/cupertino.dart';
import 'package:skdoosh/data/network/base_api_service.dart';
import 'package:skdoosh/data/network/network_api_service.dart';
import 'package:skdoosh/model/city_response.dart';
import 'package:skdoosh/model/country_response.dart';
import 'package:skdoosh/model/state_response.dart';
import 'package:skdoosh/model/success_response.dart';
import 'package:skdoosh/res/app_url.dart';

class VenuRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  
  //fetch countries 
  Future<CountryResponse>fetchCountries()async{
    try{
      dynamic response = await _apiServices.getApi(AppUrl.countryApi);
      return CountryResponse.fromJson(response);
    }
    catch (e){
      throw e;
    }
  }

  //fetch states
  Future<StateResponse>fetchStates(dynamic data)async{
    try{
      dynamic response = await _apiServices.postApi(data, AppUrl.stateApi);
      debugPrint('rep=$response');
      return StateResponse.fromJson(response);
    }
    catch(e){
      throw e;
    }
  }
  //fetch cities
  Future<CityResponse>fetchCities(dynamic data)async{
    try{
      dynamic response = await _apiServices.postApi(data, AppUrl.cityApi);
      return CityResponse.fromJson(response);
    }
    catch(e){
      throw e;
    }
  }
  // Save Venue Api
  Future<dynamic> addVenueApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.postApi(data, AppUrl.addVenueApi);
      return response;
    }
    catch (e){
      throw e;
    }
  }

  //Venue's Business information
  Future<SuccessResponse> addVenuBusinessInfo(dynamic data)async{
    try{
      dynamic response= await _apiServices.postApi(data, AppUrl.addVenueBusinessInfo);
      return SuccessResponse.fromJson(response);
    }
    catch (e){
      throw e;
    }
  }
  Future<SuccessResponse> addBankDetails(dynamic data)async{
    try{
      dynamic response= await _apiServices.postApi(data, AppUrl.addBankAccountApi);
      return SuccessResponse.fromJson(response);
    }
    catch (e){
      throw e;
    }
  }
}