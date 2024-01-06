import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'package:skdoosh/view/venue/venuescreen.dart';

import '../../res/app_color.dart';
import 'bankingvenuescreen.dart';
class KycVenueScreen extends StatefulWidget {
  const KycVenueScreen({super.key});

  @override
  State<KycVenueScreen> createState() => _KycVenueScreenState();
}

class _KycVenueScreenState extends State<KycVenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.signinpage,
      appBar: AppBar(
        backgroundColor: AppColor.signinpage,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: AppColor.lighPrimaryBg,)),
        elevation: 0,
        title: Text("Verify Business", style: TextStyle(fontFamily: "FontInter",
            fontWeight: FontWeight.w400, fontSize: 30,color: AppColor.colorblack),),

      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(20),
        // child: Center(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Container(
                //   alignment: Alignment.centerLeft,
                //   margin: EdgeInsets.only(top: 30),
                //   child: Text("Verify Business", style: TextStyle(fontFamily: "FontInter",
                //       fontWeight: FontWeight.w400, fontSize: 30),),
                // ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text("KYC (Know your clients)", style: TextStyle(fontFamily: "Inter",),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    // controller: emailcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Business Name',
                    ),
                    keyboardType: TextInputType.text,

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    // controller: emailcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter PAN Number (10digits)',
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10), // Restrict input to 10 characters
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    // controller: emailcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Business/Udyog Adhaar No.',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.only(left: 10),
                  child: Text("GST Details ", style: TextStyle(fontFamily: "Inter",),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    // controller: emailcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter GST Number',
                    ),
                    keyboardType: TextInputType.text,
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
                           //   Get.toNamed(RouteName.createVenuBankScreen);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => VenueScreen()));
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => VenueDetails()),);
                              // Handle button 1 press
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(fontSize: 12, color: AppColor.blackcolor),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.homecolor,
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
                              // Get.toNamed(RouteName.createVenuBankScreen);
                               Navigator.push(context, MaterialPageRoute(builder: (context) => VenueScreen()),);
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(fontSize: 12, color: AppColor.colorwhite),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.blackcolor,
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
          ),
        ),
      // ),
    );
  }
}
