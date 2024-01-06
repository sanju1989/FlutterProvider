import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skdoosh/model/event/event_duration_response.dart';
import 'package:skdoosh/model/event/event_frequency_response.dart';
import 'package:skdoosh/model/event/event_type_response.dart';
import 'package:skdoosh/model/venue/venue_response.dart';
import 'package:skdoosh/repository/event_repository.dart';

import '../data/response/api_response.dart';
import '../utils/Utils.dart';

class EventViewModel with ChangeNotifier {
  final _evntRepo = EventRepository();

  // final _homeRepo = Eve();
  bool _homeLoading = false;

  bool get homeLoading => _homeLoading;

  setHomeLoading(bool value) {
    _homeLoading = value;
    notifyListeners();
  }

  ApiResponse<EventDurationResponse> evntDurationList = ApiResponse.loading();
  ApiResponse<EventFrequencyResponse> eventFrequencyList =
      ApiResponse.loading();
  ApiResponse<EventTypeResponse> evntTypeList = ApiResponse.loading();
  ApiResponse<VenueResponse> venueList = ApiResponse.loading();

  setEventDurationList(ApiResponse<EventDurationResponse> response) {
    evntDurationList = response;
    debugPrint('statelist$evntDurationList');
    notifyListeners();
  }

  setEventFrequencyList(ApiResponse<EventFrequencyResponse> response) {
    eventFrequencyList = response;
    debugPrint('statelist$eventFrequencyList');
    notifyListeners();
  }

  setEventTypeList(ApiResponse<EventTypeResponse> response) {
    evntTypeList = response;
    debugPrint('statelist$evntTypeList');
    notifyListeners();
  }

  setVenueList(ApiResponse<VenueResponse> response) {
    venueList = response;
    debugPrint('statelist$venueList');
    notifyListeners();
  }

  //fetch Event Duration
  Future<void> fetchEventDuration() async {
    await _evntRepo
        .fetchDuration()
        .then((value) => {
              // debugPrint(value.toString());
              setEventDurationList(ApiResponse.completed(value))
            })
        .onError((error, stackTrace) =>
            {setEventDurationList(ApiResponse.error(error.toString()))});
  }

  //fetch Event Duration
  Future<void> fetchEventFrequency() async {
    await _evntRepo
        .fetchFrequency()
        .then((value) => {
              // debugPrint(value.toString());
              setEventFrequencyList(ApiResponse.completed(value))
            })
        .onError((error, stackTrace) =>
            {setEventFrequencyList(ApiResponse.error(error.toString()))});
  }

  //fetch event type
  Future<void> fetchEventType() async {
    await _evntRepo
        .fetchEventType()
        .then((value) => {
              // debugPrint(value.toString());
              setEventTypeList(ApiResponse.completed(value))
            })
        .onError((error, stackTrace) =>
            {setEventTypeList(ApiResponse.error(error.toString()))});
  }

  //fetch event type
  Future<void> fetchVenueList(dynamic data) async {
    await _evntRepo
        .fetchVenueList(data)
        .then((value) => {
              // debugPrint(value.toString());
              setVenueList(ApiResponse.completed(value))
            })
        .onError((error, stackTrace) =>
            {setVenueList(ApiResponse.error(error.toString()))});
  }

  //event info
  Future<void> eventInfoApi(dynamic data, BuildContext context) async {
    setHomeLoading(true);
    _evntRepo.eventInfoApi(data).then((value) {
      setHomeLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
      if (value.success == true) {
        Utility.snackBar(value.message.toString(), context);
        Navigator.pop(context);
      } else {
        Utility.snackBar(value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setHomeLoading(false);
      Utility.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
