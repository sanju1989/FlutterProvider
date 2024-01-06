import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/view_models/controller/signup/signup_view_model.dart';

import '../../../res/routes/routes_name.dart';

class SingupButtonWidget extends StatelessWidget {
  final formKey;

  SingupButtonWidget({Key? key, required this.formKey}) : super(key: key);

  final signupVM = Get.put(SingupViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              debugPrint("signup widget-");
              //Get.toNamed(RouteName.venuScreen);
            }
          },
          child: Text(
            "Continue",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
        ));
  }
}
