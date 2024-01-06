import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../colors.dart';
import '../../res/app_color.dart';
import '../../res/routes/routes_name.dart';
class AddDuties extends StatefulWidget {
  const AddDuties({super.key});

  @override
  State<AddDuties> createState() => _AddDutiesState();
}

class _AddDutiesState extends State<AddDuties> {
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
        title: Text("Add Duties",style: TextStyle(color: Colors.black,fontSize: 25),),
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
                // IconButton(
                //   onPressed: () {
                //
                //   },
                //   icon: Container(
                //     width: 80,
                //     height: 80,
                //     child: Image.asset('images/logo_profile.png'),
                //   ),
                // ),
                // SizedBox(height: 10),
                Text(
                  'S',
                  style: TextStyle(
                      fontSize: 30,color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Shweta Singh", style: TextStyle(
              fontSize: 30,),),
          Text("Supervisor"),
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
                hintText: 'Sunday 16 July 2023',
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
                hintText: 'Electro Heaven',
                suffixIcon: Icon(Icons.keyboard_arrow_down),
              ),
              keyboardType: TextInputType.text,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15,left: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: homecolor,
                  borderRadius: BorderRadius.circular(25),

                ),
                width: 100,
                height: 50,
                child: TextField(

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '15:00',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15,right: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: homecolor,
                  borderRadius: BorderRadius.circular(25),

                ),
                width: 100,
                height: 50,
                child: TextField(

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '20:00',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 15,right: 30,left: 30),
              padding: EdgeInsets.symmetric(vertical: 5),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(onPressed: () async
              {
                Get.toNamed(RouteName.editduties);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => NewEventClub()),);
              }, child: Text("Create",style: TextStyle(color: Colors.white),),
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
