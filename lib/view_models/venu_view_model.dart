import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skdoosh/data/response/api_response.dart';
import 'package:skdoosh/model/city_response.dart';
import 'package:skdoosh/model/country_response.dart';
import 'package:skdoosh/model/state_response.dart';
import 'package:skdoosh/repository/venu_repository.dart';

import '../utils/Utils.dart';
import '../view/venue/bankingvenuescreen.dart';
import '../view/venue/venuescreen.dart';

class VenuViewModel with ChangeNotifier {
  final _venuRepo = VenuRepository();

  bool _loading = false;

  bool get loading => _loading;

  ApiResponse<CountryResponse> cntryList = ApiResponse.loading();
  ApiResponse<StateResponse> stateList = ApiResponse.loading();
  ApiResponse<CityResponse> cityList = ApiResponse.loading();

  setStateList(ApiResponse<StateResponse> response) {
    stateList = response;
    debugPrint('statelist$stateList');
    notifyListeners();
  }

  setCityList(ApiResponse<CityResponse> response) {
    cityList = response;
    debugPrint('statelist$cityList');
    notifyListeners();
  }

  setCountryList(ApiResponse<CountryResponse> response) {
    cntryList = response;
    debugPrint('cntrylist$cntryList');
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //fetch countries
  Future<void> fetchCountry() async {
    await _venuRepo
        .fetchCountries()
        .then((value) => {setCountryList(ApiResponse.completed(value))})
        .onError((error, stackTrace) =>
            {setCountryList(ApiResponse.error(error.toString()))});
  }

  //fetch states
  Future<void> fetchStates(dynamic data, BuildContext context) async {
    await _venuRepo
        .fetchStates(data)
        .then((value) => {
          setStateList(ApiResponse.completed(value))
        })
        .onError((error, stackTrace) =>
            {
              setStateList(ApiResponse.error(error.toString()))
            });
  }

  //fetch cities
  Future<void> fetchCities(dynamic data, BuildContext context) async {
    _venuRepo
        .fetchCities(data)
        .then((value) => {
          setCityList(ApiResponse.completed(value))
        })
        .onError((error, stackTrace) => {
      setCityList(ApiResponse.error(error.toString()))
        });
  }

  //Add venu's api
  Future<void> addVenueApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _venuRepo.addVenueApi(data).then((value) {
      setLoading(false);
      print('object${value.success}');

      if (kDebugMode) {
        print(value.toString());
      }
      if (value.success == true) {
        Utility.snackBar(value.message.toString(),context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BankingVenueScreen()),
        );
      } else {
        Utility.snackBar(value.message.toString(),context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utility.snackBar(error.toString(),context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  //add business info
  Future<void> addBussinessInfo(dynamic data, BuildContext context) async {
    setLoading(true);
    _venuRepo.addVenuBusinessInfo(data).then((value) {
      setLoading(false);
      print('object${value.success}');

      if (kDebugMode) {
        print(value.toString());
      }
      if (value.success == true) {
        Utility.snackBar(value.message.toString(), context);
        if (data['user_role'] == 'owner') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VenueScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BankingVenueScreen()),
          );
        }
      } else {
        Utility.snackBar(value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utility.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


  Future<void> addBankDetails(dynamic data, BuildContext context) async {
    setLoading(true);
    _venuRepo.addVenuBusinessInfo(data).then((value) {
      setLoading(false);
      print('object${value.success}');

      if (kDebugMode) {
        print(value.toString());
      }
      if (value.success == true) {
        Utility.snackBar(value.message.toString(), context);
      } else {
        Utility.snackBar(value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utility.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
