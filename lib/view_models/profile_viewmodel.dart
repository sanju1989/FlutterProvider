import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skdoosh/data/response/api_response.dart';
import 'package:skdoosh/repository/profile_repository.dart';

import '../model/profileinfo_response.dart';
import '../utils/Utils.dart';

class ProfileViewModel with ChangeNotifier{
  final _profileRepo= ProfileRepository();
  bool _homeLoading = false;


  bool get homeLoading => _homeLoading;
  ApiResponse<ProfileInfoResponse> profileData = ApiResponse.loading();

  setHomeLoading(bool value) {
    _homeLoading = value;
    notifyListeners();
  }
  setProfileData(ApiResponse<ProfileInfoResponse>  value){
    profileData = value;
    debugPrint('statelist$profileData');
    notifyListeners();
  }

  //ApiResponse<ProfileInfoResponse> profileinfo = ApiResponse.loading();

  Future<void> fetchProfileInfo(dynamic user_id, BuildContext context) async {
    setHomeLoading(true);
    _profileRepo.fetchProfileInfo(user_id).then((value) {
      setHomeLoading(false);
      setProfileData(ApiResponse.completed(value));
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