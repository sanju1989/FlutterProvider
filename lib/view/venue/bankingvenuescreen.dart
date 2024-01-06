import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:skdoosh/res/component/RoundButton.dart';
import 'package:skdoosh/res/component/newroundbtn.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'package:skdoosh/view/home/MainScreen.dart';
import 'package:skdoosh/view/venue/socialmedia.dart';
import 'package:skdoosh/view_models/venu_view_model.dart';

import '../../res/app_color.dart';
import '../../utils/Utils.dart';
import '../event/neweventscreen.dart';
class BankingVenueScreen extends StatefulWidget {
  const BankingVenueScreen({super.key});

  @override
  State<BankingVenueScreen> createState() => _BankingVenueScreenState();
}

class _BankingVenueScreenState extends State<BankingVenueScreen> {
  VenuViewModel venuViewModel=VenuViewModel();
  TextEditingController accntController = TextEditingController();
  TextEditingController accntNoController = TextEditingController();
  TextEditingController cnfrmAccntNoController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController upiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.signinpage,
      appBar: AppBar(
        backgroundColor: AppColor.signinpage,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: AppColor.colorblack,size: 35,)),
                title: Text("Banking Details", style: TextStyle(fontFamily: "FontInter",
            fontWeight: FontWeight.w400, fontSize: 30,color: AppColor.colorblack),),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        padding: const EdgeInsets.all(10),
        // child: Center(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Container(
                //   alignment: Alignment.centerLeft,
                //   margin: EdgeInsets.only(top: 30),
                //   child: Text("Create a new venue", style: TextStyle(fontFamily: "FontInter", fontSize: 30),),
                // ),
                Container(
                  alignment: Alignment.centerLeft,
                  //margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Banking Details)", style: TextStyle(fontFamily: "FontInter",),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30,left: 20,right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                     controller: accntController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Account Name',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                     controller: accntNoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Account Number',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                     controller: cnfrmAccntNoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Account Number',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                     controller: ifscController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'IFSC Code',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                     controller: upiController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'UPI ID',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30,left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const MainScreen();
                                  },
                                ),
                                    (_) => false,
                              );
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
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: NewRoundbtn(
                          radius: 30,
                          title: 'Finish',
                          onPress: (){
                            if(accntController.text.isEmpty){
                              Utility.snackBar('Account Name require',context);
                            }
                            else if(accntNoController.text.isEmpty){
                              Utility.snackBar('Account Number require',context);
                            }
                            else if(cnfrmAccntNoController.text.isEmpty){
                              Utility.snackBar('Account Number not matched',context);
                            }
                            else if(ifscController.text.isEmpty){
                              Utility.snackBar('IFSC Code require',context);
                            }
                            else{
                              Map data={
                                "account_name":"klkl",
                                "account_no":"klkl",
                                "ifsc_code":"jlklk",
                                "upi_id":"klkl",
                              };
                              venuViewModel.addBussinessInfo(data, context);
                            }
                          },
                        ),
                        // child: ElevatedButton(
                        //   onPressed: () {
                        //    // Get.toNamed(RouteName.mainScreen);
                        //      Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()),);
                        //   },
                        //   child: Text(
                        //     'Finish',
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
