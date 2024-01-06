import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:skdoosh/repository/signup_repository.dart';
import 'package:http/http.dart' as http;
import '../../../utils/Utils.dart';

class SingupViewModel extends GetxController {
  final _api = SignupRepository();
  RxBool loading = false.obs;
  final fullNameController = TextEditingController().obs;
  final phoneNoController= TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final fullNameFocus = FocusNode().obs;
  final phoneNoFocus = FocusNode().obs;
  final emailFocus = FocusNode().obs;

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
  }

  void loginApi() {
    debugPrint("inside loginapi");
    loading.value = true;
    Map data = {
      'user_name': fullNameController.value.text,
      'user_phone': phoneNoController.value.text,
      'user_email': emailController.value.text
    };

    // Map data ={
    //   'name':'test',
    //   'salary':'909',
    //   'age'
    //   {"name":"test","salary":"123","age":"23"}
    // };
    _api.signupApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utility.snackBar('Login', value['error']);
      } else {
       // Utility.snackBar('Login', 'Login successfully');
      }
    }).onError((error, stackTrace) {
      loading.value = false;
     // Utility.snackBar('Error', error.toString());
    });
  }
}
