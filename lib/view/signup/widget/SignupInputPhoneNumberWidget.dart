import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/utils/Utils.dart';
import 'package:skdoosh/utils/calendar/date_utils.dart';
import 'package:skdoosh/view_models/controller/signin/login_view_model.dart';
import 'package:skdoosh/view_models/controller/signup/signup_view_model.dart';

class SignupInputPhoneNumberWidget extends StatelessWidget {
  SignupInputPhoneNumberWidget({super.key});

  final signupVM = Get.put(SingupViewModel());
  RegExp get _phoneRegex => RegExp(r'\d{10}');
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupVM.phoneNoController.value,
      focusNode: signupVM.phoneNoFocus.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utility.snackBar('Phone Number is required',context);
        }
        if(!_phoneRegex.hasMatch(value)){
          Utility.snackBar('Phone Number is not valid',context);
        }
      },
      keyboardType: TextInputType.number,
      onFieldSubmitted: (value) {
        Utility.fieldFocusChange(
            context, signupVM.phoneNoFocus.value, signupVM.emailFocus.value);
      },
      decoration:
          InputDecoration(border: InputBorder.none, hintText: 'Phone Number'),
    );
  }
}
