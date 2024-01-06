import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../colors.dart';
import '../../res/app_color.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text("Edit Profile",style: TextStyle(color: Colors.black,fontSize: 25),),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.profilecolor),
            width: double.infinity,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'S',
                  style: TextStyle(
                      fontSize: 30,color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 30,right: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: homecolor,
              borderRadius: BorderRadius.circular(25),

            ),
            width: double.infinity,
            height: 50,
            child: TextField(
              // controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 30,right: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: homecolor,
              borderRadius: BorderRadius.circular(25),

            ),
            width: double.infinity,
            height: 50,
            child: TextField(
              // controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Designation',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 30,right: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: homecolor,
              borderRadius: BorderRadius.circular(25),

            ),
            width: double.infinity,
            height: 50,
            child: TextField(
              // controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Phone Number',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 30,right: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: homecolor,
              borderRadius: BorderRadius.circular(25),

            ),
            width: double.infinity,
            height: 50,
            child: TextField(
              // controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email ID',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 30,right: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: homecolor,
              borderRadius: BorderRadius.circular(25),

            ),
            width: double.infinity,
            height: 50,
            child: TextField(
              // controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Address',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 15,right: 30,left: 30),
              padding: EdgeInsets.symmetric(vertical: 5),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(onPressed: () async
              {
                // Get.toNamed(RouteName.editduties);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => NewEventClub()),);
              }, child: Text("Save",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)

                    )),)
          ),
        ],
      ),

    );
  }
}
