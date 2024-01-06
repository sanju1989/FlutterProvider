import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/res/component/RoundButton.dart';
import 'package:skdoosh/res/component/newroundbtn.dart';
import 'package:skdoosh/view/venue/bankingvenuescreen.dart';
import 'package:skdoosh/view/venue/venuescreen.dart';

import '../../res/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/Utils.dart';
import '../../view_models/venu_view_model.dart';

class VerifyBusinessKyc extends StatefulWidget {
  VerifyBusinessKyc(this.user_role, {super.key});

  final String user_role;

  @override
  State<VerifyBusinessKyc> createState() => _VerifyBusinessKycState();
}

class _VerifyBusinessKycState extends State<VerifyBusinessKyc> {
  VenuViewModel venuViewModel = VenuViewModel();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController udyogNoController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  //  final venuViewModel = Provider.of<VenuViewModel>(context);

    return Scaffold(
      backgroundColor: AppColor.signinpage,
      appBar: AppBar(
        backgroundColor: AppColor.signinpage,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.colorblack,
              size: 35,
            )),
        elevation: 0,
        title: Text(
          "Verify Business",
          style: TextStyle(
              fontFamily: "FontInter",
              fontWeight: FontWeight.w400,
              fontSize: 30,
              color: AppColor.colorblack),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: const EdgeInsets.all(30),
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
                child: Text(
                  "KYC (Know your clients)",
                  style: TextStyle(
                    fontFamily: "Inter",
                  ),
                ),
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
                   controller: businessNameController,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: 'Business Name',
                  ),
                  maxLength: 50,

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
                   controller: panController,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: 'Enter PAN Number (10digits)',
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    // Restrict input to 10 characters
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
                   controller: udyogNoController,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: 'Business/Udyog Adhaar No.',
                  ),
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "GST Details ",
                  style: TextStyle(
                    fontFamily: "Inter",
                  ),
                ),
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
                   controller: gstController,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: 'Enter GST Number',
                  ),
                  maxLength: 15,
                  keyboardType: TextInputType.text,
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 130,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            Get.toNamed(RouteName.createVenuBankScreen);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => VenueDetails()));
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => VenueDetails()),);
                            // Handle button 1 press
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                fontSize: 12, color: AppColor.blackcolor),
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
                    SizedBox(
                      height: 50,
                      width: 130,
                      child: NewRoundbtn(
                        radius: 30,
                        title: "Next(1/2)",
                        loading: venuViewModel.loading,
                        onPress: () {
                          if(businessNameController.text.isEmpty){
                            Utility.snackBar('Business Name require',context);
                          }
                          else if(panController.text.isEmpty){
                            Utility.snackBar('PAN require',context);
                          }
                          else if(udyogNoController.text.isEmpty){
                            Utility.snackBar('Business/Udyog No require',context);
                          }
                          else if(gstController.text.isEmpty){
                            Utility.snackBar('GST require',context);
                          }
                          else{
                            Map data = {
                              'business_name':businessNameController.text.toString(),
                              'pan':panController.text.toString(),
                              'udyog_aadhar_no': udyogNoController.text.toString(),
                              'gstin': gstController.text.toString(),
                              'user_id':'1',
                              'user_role':widget.user_role
                            };
                            venuViewModel.addBussinessInfo(data, context);
                          }
                        },
                      ),
                      // child: ElevatedButton(
                      //   onPressed: () {
                      //     // Get.toNamed(RouteName.createVenuBankScreen);
                      //     if(widget.user_role=='owner'){
                      //       Navigator.push(context, MaterialPageRoute(builder: (context) => VenueScreen()),);
                      //     }
                      //     else{
                      //       Navigator.push(context, MaterialPageRoute(builder: (context) => BankingVenueScreen()),);
                      //     }
                      //   },
                      //   child: Text(
                      //     'Next (1/2)',
                      //     style: TextStyle(fontSize: 12, color: AppColor.colorwhite),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     primary: AppColor.blackcolor,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(25)),
                      //   ),
                      // ),
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
