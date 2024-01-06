import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/view/profile/createprofile.dart';

import '../../res/app_color.dart';
import '../../res/routes/routes_name.dart';
class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreen();
}

class _CreateProfileScreen extends State<CreateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
         leading: null,
        title: Text("Profile",style: TextStyle(color: Colors.black,fontSize: 30),),
        actions: [
          Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(RouteName.editprofilescreen);
                      },
                      icon: Icon(Icons.edit,color: Colors.white,)),
                ),
              ))
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.only(top: 80.0,right: 20,left: 20),
        child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: AppColor.homecolor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0)
              ),
            ),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const SizedBox(height: 80,),

                  Text("Shweta Singh",style: TextStyle(fontSize: 25),),
                  Text("Supervisor"),


                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                    child: Image.asset("images/scanner.png"),
                  ),

                  const SizedBox(height: 10.0),

                  SizedBox(height: 20,),
                  Text("Employe ID Number"),
                  Text("1234567890",style: TextStyle(fontSize: 25),),
                  Container(height: 20,
                      child: Divider(color: Colors.white,)),
                  Text("Phone Number"),
                  Text("+91 1234567890",style: TextStyle(fontSize: 25),),
                  Container(height: 20,
                      child: Divider(color: Colors.white,)),

                  Text("Email ID"),
                  Text("shwetasingh@gmail.com",style: TextStyle(fontSize: 20),),
                  Container(height: 20,
                      child: Divider(color: Colors.white,)),

                  Text("Address"),
                  Text("123,Random Address,\n Random City 123",style: TextStyle(fontSize: 20),),
                  Container(height: 20,
                      child: Divider(color: Colors.white,)),
                  Text("Duty"),
                  // Row(
                  //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15,),
                        // padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),

                        ),
                        width: 350,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(

                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: homecolor,
                                shape: BoxShape.circle,

                              ),
                              width: 100,
                              height: 40,

                            ),
                            Text("M"),
                            Container(

                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: homecolor,
                                shape: BoxShape.circle,

                              ),
                              width: 100,
                              height: 40,

                            ),
                            Container(

                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: homecolor,
                                shape: BoxShape.circle,

                              ),
                              width: 100,
                              height: 40,

                            ),

                          ],
                        ),
                        

                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 15,right: 30),
                      //   padding: EdgeInsets.symmetric(horizontal: 20),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     shape: BoxShape.circle,
                      //
                      //   ),
                      //   width: 100,
                      //   height: 50,
                      //  child: Icon(Icons.add),
                      // ),
                    ],
                //   ),
                // ],
              ),
            ),
          ),


          //Circle Avatar

          Positioned(
            width: MediaQuery.of(context).size.width,
            top: -75,
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                  child: Image.asset('images/person_profile.png')
              ),
            ),
          ),
        ],
    ),
      ),
    );
  }
}