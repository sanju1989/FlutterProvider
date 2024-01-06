import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/data/response/status.dart';
import 'package:skdoosh/res/colors.dart';
import 'package:skdoosh/utils/Utils.dart';
import 'package:skdoosh/view/profile/userroles.dart';
import 'package:skdoosh/view/venue/venue_roles.dart';
import 'package:skdoosh/view_models/profile_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../res/app_color.dart';
import '../home/notificationdrawer.dart';
import '../home/sidebar.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({super.key});

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  ProfileViewModel profileViewModel = ProfileViewModel();
  String _userName = '';
  String user_id = '';
  String business_name = "";

  _getUserInfo() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action1 = prefs.getString('user_id');
    final String? action2 = prefs.getString('user_name');
    final String? action3 = prefs.getString('business_name');
    debugPrint('user-ud=${action1}');
    debugPrint('user-ud=${action2}');
    debugPrint('business_name=${action3}');
    setState(() {
      _userName = action2.toString();
      business_name = action3.toString();
      Map data = {
        'user_id': action1,
      };
      profileViewModel.fetchProfileInfo(data, context);
    });
  }

  @override
  void initState() {
    _getUserInfo();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorblack,
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: AppBar(
            backgroundColor: AppColor.colorblack,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            actions: [
              Builder(
                  builder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          // decoration: const BoxDecoration(
                          //     shape: BoxShape.circle, color: primaryBg),
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset('images/scanner_camera.png')),
                        ),
                      ))
            ],
          ),
        ),
        key: _scaffoldKey,
        // drawer: MyDrawer(),
        //  endDrawer: NotificationDrawer(),

        body: Center(
          child: ChangeNotifierProvider<ProfileViewModel>(
            create: (BuildContext context) => profileViewModel,
            child: Consumer<ProfileViewModel>(
              builder: (context, value, _) {
                switch (value.profileData.status) {
                  case Status.LOADING:
                    return SizedBox(
                      height: 50,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  case Status.ERROR:
                    debugPrint(value.profileData.message);
                    return Text('data');
                  case Status.COMPLETED:
                    debugPrint(
                        value.profileData.data?.data?.userInfo?.businessName);
                    //return Text('data');
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hii",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "FontInter",
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "${value.profileData.data?.data?.userInfo?.userName}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "FontInter",
                              fontWeight: FontWeight.w300,
                              fontSize: 30),
                        ),
                        Container(
                          height: 150,
                          margin: EdgeInsets.only(top: 20),
                          child: Image.asset(
                            "images/qr_code.png",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if(value.profileData.data?.data?.userInfo?.businessName==null)...[
                          Text(
                            "No Business Name ",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "FontInter",
                                fontWeight: FontWeight.w300,
                                fontSize: 15),
                          ),
                        ]
                        else...[
                          Text(
                            "${value.profileData.data?.data?.userInfo?.businessName}",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "FontInter",
                                fontWeight: FontWeight.w300,
                                fontSize: 15),
                          ),
                        ],

                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    if(value.profileData.data?.data?.userInfo?.businessName==null ){
                                      Utility.snackBar('Please add business first', context);
                                    }
                                    else{
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VenueRolescreen()));
                                    }
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.containerlightcolor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Venue",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontFamily: "FonteInter",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: AppColor.textpurplecolor,
                                              fontFamily: "FonteInter",
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    );
                  default:
                    return Text('data');
                }
                return Text('data');
              },
            ),
          ),
          /*child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text("Hii",style: TextStyle(color: Colors.white,fontFamily: "FontInter",
              fontWeight: FontWeight.w300),),

           Text(_userName,style: TextStyle(color: Colors.white,fontFamily: "FontInter",
               fontWeight: FontWeight.w300,fontSize: 30),),

      Container(height: 150,
        margin: EdgeInsets.only(top: 20),
        child: Image.asset("images/qr_code.png",),),

          SizedBox(height: 20,),
          Text("Business Name",style: TextStyle(color: Colors.white,fontFamily: "FontInter",
          fontWeight: FontWeight.w300,fontSize: 15),),

          SizedBox(height: 50,),
          Padding(padding: EdgeInsets.all(20),
            child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             */ /* GestureDetector(
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UserRolescreen()),);
              },
                child:
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.usercontainercolor),
            child: Align(alignment: Alignment.center,
              child: Text("Users\nRoles",style: TextStyle(
              color: AppColor.containercolor,fontFamily: "FonteInter", fontWeight: FontWeight.w600),
            ),),
          ),
              ),*/ /*

            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => VenueRolescreen()));
            },child:
            Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.containerlightcolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Align(alignment: Alignment.center,
                child: Text("Venue",style: TextStyle(fontSize: 18,
                    color: Colors.black,fontFamily: "FonteInter", fontWeight: FontWeight.w400),
                ),),
                   Container(height: 30,width: 1,
                   color: Colors.black,),
                   Text("3",style: TextStyle(fontSize: 18,
                      color: AppColor.textpurplecolor,fontFamily: "FonteInter", fontWeight: FontWeight.w600),
                  ),
                ],),
            ),
            ),
          ],),
          ),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(top: 40,left: 30,right: 30),
          )
        ],),*/
        ));
  }
}
