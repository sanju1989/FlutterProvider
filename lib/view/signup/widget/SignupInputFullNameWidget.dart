import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/utils/Utils.dart';
import 'package:skdoosh/view_models/controller/signup/signup_view_model.dart';

class SignupInputFullNameWidget extends StatelessWidget {
  SignupInputFullNameWidget({super.key});

  final signupVM = Get.put(SingupViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupVM.fullNameController.value,
      focusNode: signupVM.fullNameFocus.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utility.snackBar('Full Name is required',context);
        }
      },
      onFieldSubmitted: (value) {
        Utility.fieldFocusChange(
            context, signupVM.fullNameFocus.value, signupVM.phoneNoFocus.value);
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Full Name',
      ),
      keyboardType: TextInputType.text,
    );
  }
}
