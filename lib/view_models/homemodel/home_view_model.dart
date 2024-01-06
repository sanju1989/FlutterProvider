

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../repository/home_repository.dart';
import '../../utils/Utils.dart';

class HomeViewModel with ChangeNotifier{
  final _homeRepo = HomeRepository();
  bool _homeLoading = false;

  bool get homeLoading => _homeLoading;

  setHomeLoading(bool value) {
    _homeLoading = value;
    notifyListeners();
  }
  Future<void> homeApi(dynamic user_id, BuildContext context) async {
    setHomeLoading(true);
    _homeRepo.homeApi(user_id).then((value) {
      setHomeLoading(false);

      if (kDebugMode) {
        print(value.toString());
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