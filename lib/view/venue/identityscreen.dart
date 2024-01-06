import 'package:flutter/material.dart';
import 'package:skdoosh/view/signup/signupscreen.dart';
import 'package:skdoosh/view/venue/venuedetails.dart';
import 'package:skdoosh/view/venue/veribusinesskyc.dart';

import '../../res/app_color.dart';
import 'kycvenuescreen.dart';
class IdentityScreen extends StatefulWidget {
  const IdentityScreen({super.key});

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
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
        margin: const EdgeInsets.only(top: 50),
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
                "Identity",
                style: TextStyle(
                    fontFamily: "FontInter",fontWeight: FontWeight.w500, fontSize: 40, color: Colors.white),
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
              padding: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () async {
                         // Get.toNamed(RouteName.createVenuDetailScreen);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => VenueDetails()));
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Signupscreen('owner')),);
                          // Handle button 1 press
                        },
                        child: Text(
                          'Venue Owner',
                          style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "FontInter",
                              fontSize: 12, color: AppColor.blackcolor),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.lighPrimaryBg,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () {
                 //         Get.toNamed(RouteName.mainScreen);
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Signupscreen('eventcreator')),);
                        },
                        child: Text(
                          'Event Cuprator',
                          style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "FontInter",
                              fontSize: 12, color: AppColor.colorblack),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.lighPrimaryBg,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
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
