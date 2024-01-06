import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/utils/Utils.dart';
import 'package:skdoosh/utils/calendar/date_utils.dart';
import 'package:skdoosh/view_models/controller/signin/login_view_model.dart';

class InputPhoneNumberWidget extends StatelessWidget {
  InputPhoneNumberWidget({super.key});

  final loginVM = Get.put(LoginViewModel());
  RegExp get _phoneRegex => RegExp(r'\d{10}');

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.phoneNoController.value,
      focusNode: loginVM.phoneNoFocus.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utility.snackBar('Phone Number is required',context);
        }
        if(!_phoneRegex.hasMatch(value)){
          Utility.snackBar('Phone Number is not valid',context);
        }
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Phone Number'
      ),
    );
  }
}
