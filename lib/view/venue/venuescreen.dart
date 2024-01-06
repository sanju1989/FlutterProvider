import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'package:skdoosh/view/signup/signupscreen.dart';
import 'package:skdoosh/view/venue/bankingvenuescreen.dart';
import 'package:skdoosh/view/venue/kycvenuescreen.dart';
import 'package:skdoosh/view/venue/venuedetails.dart';


import '../../res/app_color.dart';

class VenueScreen extends StatefulWidget {
  const VenueScreen({super.key});

  @override
  State<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBg,
      appBar: AppBar(
        backgroundColor: AppColor.primaryBg,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: AppColor.lighPrimaryBg,size: 30,)),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.only(top: 10),
        // child: Center(
          // child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/Skdoosh_logo1.png",
                  height: 150,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 60),
                child: Text(
                  "Venue",
                  style: TextStyle(
                      fontFamily: "Inter", fontSize: 40, color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Lorem Ipsum Is Simply Dummy Text of The Printing And Typesetting Industry. Lorem Ipsum Is Simply Dummy Text of The Printing And Typesetting Industry.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () async {
                            Get.toNamed(RouteName.createVenuDetailScreen);
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => VenueDetails()));
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => VenueDetails()),);
                            // Handle button 1 press
                          },
                          child: Text(
                            'Create Venue',
                            style: TextStyle(fontSize: 12, color: AppColor.colorwhite),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.colorblack,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(RouteName.mainScreen);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => VenueDetails()),);
                          },
                          child: Text(
                            'Skip for Later',
                            style: TextStyle(fontSize: 12, color: AppColor.colorblack),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.homecolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          // ),
        // ),
      ),
    );
  }
}
