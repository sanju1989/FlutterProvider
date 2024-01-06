import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/res/app_color.dart';

import '../../colors.dart';

class PersonalDetailScreen extends StatefulWidget {
  const PersonalDetailScreen({super.key});


  @override
  State<PersonalDetailScreen> createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  bool _isDark = true;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
      backgroundColor: AppColor.colorblack,
      appBar: AppBar(
        backgroundColor: AppColor.colorblack,
        title: Text("Personal Details", style: TextStyle(fontSize: 20,fontFamily: 'FontInter'),),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
        body: SingleChildScrollView(child:
        Center(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.greyD9D9D9,
              ),
              height: 150,
              width: 150,
              child: Center(
                child: Text("S",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: 50,
              child: TextField(
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'FontInter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: 50,
              child: TextField(
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'FontInter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone Number',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: 50,
              child: TextField(
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'FontInter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email id',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              height: 50,
              width: 130,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontFamily: 'FontIner',fontSize: 12),
                ),
                style: ElevatedButton.styleFrom(
                  primary: singupcolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
          ],),
        ),
      ),),
    );
  }
}
