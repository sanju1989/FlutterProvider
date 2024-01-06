
import 'package:flutter/cupertino.dart';
import 'package:skdoosh/data/response/api_response.dart';
import 'package:skdoosh/repository/employee_repository.dart';

import '../data/response/status.dart';
import '../model/employee_response.dart';

class EmployeeViewModel with ChangeNotifier{
  final _employeetypeRepo = EmployeeRepository();
  Status _status = Status.LOADING;

  Status get status => _status;
  ApiResponse<EmployeeTypeResponse> employeelist = ApiResponse.loading();

  bool _loading = false;

  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  setemployeelist(ApiResponse<EmployeeTypeResponse> response){
    employeelist = response;
    debugPrint('statelist$employeelist');
    notifyListeners();
  }
  Future<void> fetchEmployeeList() async {
    await _employeetypeRepo
        .fetchTicketCategory()
        .then((value) => {setemployeelist(ApiResponse.completed(value))})
        .onError((error, stackTrace) =>
    {setemployeelist(ApiResponse.error(error.toString()))});
  }
}