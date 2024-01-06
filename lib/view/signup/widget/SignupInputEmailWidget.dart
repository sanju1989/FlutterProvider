import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/utils/Utils.dart';
import 'package:skdoosh/view_models/controller/signup/signup_view_model.dart';

class SignupInputEmailWidget extends StatelessWidget {
  SignupInputEmailWidget({super.key});

  final signupVM = Get.put(SingupViewModel());
  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupVM.emailController.value,
      focusNode: signupVM.emailFocus.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utility.snackBar('Email is required',context);
        }
        if(_emailRegex.hasMatch(value)){
          Utility.snackBar('Email is not valid',context);
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Enter your email'),
    );
  }
}
