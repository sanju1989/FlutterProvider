
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:skdoosh/repository/login_repository.dart';
import 'package:skdoosh/utils/Utils.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends GetxController{

  final _api= LoginRepository();

  RxBool loading = false.obs;
  final phoneNoController = TextEditingController().obs;
  final phoneNoFocus = FocusNode().obs;

  Future<void> loginApi() async {
    try {
      loading.value = true;
      Map data = {
        'user_phone': phoneNoController.value.text
      };
      // Map data={
      //   'name':'abc',
      //   'salary':'8989',
      //   'age':'99'
      // };
      // http.Response response = await http.post(Uri.parse(
      //     'http://172.16.1.241:8000/api/v1/login/generate-otp'), body: data);
      // if (response.statusCode == 200) {
      //
      // }
      // else {
      //   print('error fetching data');
      // }

        _api.otpGenerateApi(data).then((value){
      loading.value=false;
      if(value['error']=='user not found'){
        Utility.snackBar('Login', value['error']);
      }
      else{
        //Utility.snackBar('Login successfully',context);
      }
    }).onError((error, stackTrace){
      loading.value = false;
      //Utility.snackBar(error.toString(),context);
    });
    }
    catch(e){
      print(e);
    }
  }
}


/*
fetchData() async {
  try {
    loading(true);
    Map data = {
      'user_name': fullNameController.value.text,
      'user_phone': phoneNoController.value.text,
      'user_email': emailController.value.text
    };
    http.Response response = await http.post(Uri.parse(
        'http://172.16.1.241:8000/api/v1/login/sign-up'),body: data);
    if (response.statusCode == 200) {
      ///data successfully
      var result = jsonDecode(response.body);
      debugPrint(result.toString());
      //openseaModel = OpenseaModel.fromJson(result);
    } else {
      print('error fetching data');
    }
  } catch (e) {
    print('Error while getting data is $e');
  } finally {
    loading(false);
  }
}*/
