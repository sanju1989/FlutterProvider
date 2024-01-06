import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skdoosh/model/ticket/AddTicketResponse.dart';
import 'package:skdoosh/model/ticket/TicketCategoryResponse.dart';
import 'package:skdoosh/model/ticket/ticketlist_response.dart';
import 'package:skdoosh/repository/ticket_repository.dart';

import '../data/response/api_response.dart';
import '../data/response/status.dart';
import '../utils/Utils.dart';

class TicketViewModel with ChangeNotifier {
  final _ticketRepo = TicketRepository();
  // final TicketRepository _ticketRepository = TicketRepository();
  dynamic _ticketInfo;

  dynamic get ticketInfo => _ticketInfo;
  Status _status = Status.LOADING;

  Status get status => _status;
  ApiResponse<TicketCategoryResponse> ticketCtgryList = ApiResponse.loading();
  ApiResponse<TicketListResponse> ticketList = ApiResponse.loading();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  setTicketCtgryList(ApiResponse<TicketCategoryResponse> response) {
    ticketCtgryList = response;
    debugPrint('statelist$ticketCtgryList');
    notifyListeners();
  }
  setTicketList(ApiResponse<TicketListResponse> response) {
    ticketList = response;
    debugPrint('statelist$ticketList');
    notifyListeners();
  }

  //fetch ticket categories
  Future<void> fetchTicketCategory() async {
    await _ticketRepo
        .fetchTicketCategory()
        .then((value) => {setTicketCtgryList(ApiResponse.completed(value))})
        .onError((error, stackTrace) =>
            {setTicketCtgryList(ApiResponse.error(error.toString()))});
  }


  //fetch ticket list
  Future<void> fetchSavedTicketList() async {
    await _ticketRepo
        .fetchTicketList()
        .then((value) => {setTicketList(ApiResponse.completed(value))})
        .onError((error, stackTrace) =>
    {setTicketList(ApiResponse.error(error.toString()))});
  }


  //Add ticket's api
  Future<void> addTicket(dynamic data, BuildContext context) async {
    setLoading(true);
    _ticketRepo.addTicket(data).then((value) {
      setLoading(false);


      if (kDebugMode) {
        print(value.toString());
      }
      if (value.success == true) {
        Utility.snackBar(value.message.toString(),context);
       Navigator.pop(context);
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
//ticket info
  Future<void> fetchTicketInfo(String ticketId, BuildContext context) async {
    setLoading(true);
    _ticketRepo.fetchTicketInfo(ticketId).then((value) {
      setLoading(false);

      if (kDebugMode) {
        print(value.toString());
      }
      if (value.success == true) {
        Utility.snackBar(value.message.toString(),context);
        Navigator.pop(context);
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
}
