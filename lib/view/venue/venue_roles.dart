import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/view/venue/editvenue.dart';
import 'package:skdoosh/view/venue/venuedetails.dart';

import '../../colors.dart';
import '../../res/routes/routes_name.dart';
class VenueRolescreen extends StatefulWidget {
  const VenueRolescreen({super.key});

  @override
  State<VenueRolescreen> createState() => _VenueRolescreenState();
}

class _VenueRolescreenState extends State<VenueRolescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.colorblack,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: Text("Venues",style: TextStyle(color: Colors.white,
        fontFamily: "FontInter",fontWeight: FontWeight.w400,fontSize: 25),),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.containerlightcolor,
          ),
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Padding(padding: EdgeInsets.all(5),child:
          Row(
            children: [
              Expanded(
                // child: Align(
                //   alignment: Alignment.centerLeft,
                  child: Text(
                    "Electro Heaven",
                    style: TextStyle(fontSize: 18,
                      fontFamily: "FontInter",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                // ),
              ),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditVenueScreen()));
                }, icon: Icon(Icons.arrow_forward_ios, color: Colors.black),)
                //
            ],
          ),),
        ),

        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.containerlightcolor,
          ),
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Padding(padding: EdgeInsets.all(10),child:
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Rusty Notes",
                    style: TextStyle(fontSize: 18,
                      fontFamily: "FontInter",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black),
            ],
          ),),
        ),

        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.containerlightcolor,
          ),
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Padding(padding: EdgeInsets.all(10),child:
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lorem Ipsum",
                    style: TextStyle(fontSize: 18,
                      fontFamily: "FontInter",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black),
            ],
          ),),
        ),
        SizedBox(height: 50,),
        SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VenueDetails()),
              );
              // Handle button 1 press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryBg,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                  child:Icon(Icons.add,size: 15,),),
            Text('Create Venue',
              style: TextStyle(fontSize: 12, fontFamily: 'FontIner', color: Colors.white),
            ),],)
          ),
        ),
      ],),
    );
  }
}
