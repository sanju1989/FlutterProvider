import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:skdoosh/view/event/neweventclub.dart';
import '../../res/app_color.dart';
import '../../res/routes/routes_name.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../home/notificationdrawer.dart';
class EditEventScreen extends StatefulWidget {
  const EditEventScreen({super.key});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  bool instagramstatus = false;
  bool facebookstatus = false;
  bool twitterstatus = false;
  bool messagestatus = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var imageFile;

  Future _getImage(int type) async {
    ImagePicker abc = ImagePicker();
    ImageCropper cropper = ImageCropper();

    var image = await abc.pickImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 90);
    print('image=$image');
    if (image != null) {
      imageFile = image.path;
      print("You selected  image : " + image.path);
      setState(() {
        debugPrint("SELECTED IMAGE PICK   $imageFile");
      });
    } else {
      print("You have not taken image");
    }
    // var croppedFile = (await cropper.cropImage(
    //   sourcePath: image!.path,
    //   maxWidth: 600,
    //   maxHeight: 600,
    // )) ;
    //
    // print('cropp$croppedFile');
    // var compressedFile = await FlutterImageCompress.compressAndGetFile(
    //   File(croppedFile.toString()).path,
    //   File(croppedFile.toString()).path,
    //   quality: 50,
    // );
    //print('compress$compressedFile');
    // setState(() {
    //   imageFile = compressedFile as File;
    //   print(imageFile);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 30.0
                )),
          ),
          title: Center(
            child: Text(
              "Edit Events",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,fontFamily: "FontInter",
                  fontWeight: FontWeight.w400),
            ),
          ),
          actions: [
            Builder(
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.primaryBg),
                    child: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        icon: Image.asset('images/Notification.png')),
                  ),
                ))
          ],
        ),
      ),
      key: _scaffoldKey,
      // drawer: MyDrawer(),
      endDrawer: NotificationDrawer(),

      body:
      // Center(
      //   child:
      SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          //  Text("Create a new event",style: TextStyle(fontSize: 25),),

            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryBg),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.colorwhite),
              width: 100,
              height: 100,
              child: imageFile == null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text('Image Choose'),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        _getImage(1);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Camera')),
                                  ElevatedButton(
                                      onPressed: () {
                                        _getImage(2);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Gallery'))
                                ]);
                          });
                    },
                    icon: Container(
                      width: 180,
                      height: 180,
                      child: imageFile == null
                          ? Image.asset('images/logo_profile.png')
                          : Image.file(File(imageFile)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Add Creatives',
                    style: TextStyle(fontSize: 9),
                  ),
                ],
              )
                  : InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Image Choose'),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      _getImage(1);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Camera')),
                                ElevatedButton(
                                    onPressed: () {
                                      _getImage(2);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Gallery'))
                              ]);
                        });
                  },
                  child: Image.file(File(imageFile))),
            ),
            Container(
              margin: EdgeInsets.only(top: 30,left: 30,right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),

              ),
              width: double.infinity,
              height: 50,
              child: TextField(
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Loreum Ipsum',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15,left: 30,right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),

              ),
              width: double.infinity,
              height: 50,
              child: TextField(
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Multiple Days',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                    color: AppColor.colorwhite,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: 150,
                  height: 50,
                  child: TextField(

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'DD/MM/YYYY ',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15,right: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                    color: AppColor.colorwhite,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  width: 150,
                  height: 50,
                  child: TextField(

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '00:00 - 00:00',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15,left: 30,right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),

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
            Container(
              margin: EdgeInsets.only(top: 15,left: 30,right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),

              ),
              width: double.infinity,
              height: 50,
              child: TextField(
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Club Party',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                ),
                keyboardType: TextInputType.text,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15,left: 30,right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),

              ),
              width: double.infinity,
              height: 50,
              child: TextField(
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'One Time Event',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15,left: 30,right: 30),
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),

              ),
              width: double.infinity,
              height: 120,
              child: TextField(
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Additional Details...',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Column(
            //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Container(
            //           margin: EdgeInsets.only(top: 15,left: 30),
            //           // padding: EdgeInsets.symmetric(horizontal: 30),
            //           decoration: BoxDecoration(
            //             color: primaryBg,
            //             borderRadius: BorderRadius.circular(40),
            //           ),
            //           width: 250,
            //           height: 200,
            //           child: Column(
            //             children: [
            //               Row(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     padding: EdgeInsets.only(left: 20,),
            //                     child: IconButton(
            //                       onPressed: () {
            //
            //                       },
            //                       icon: Container(
            //                         width: 25,
            //                         height: 20,
            //                         child: Image.asset('images/instagram.png'),
            //                       ),
            //
            //                     ),
            //                   ),
            //                   Text("Instagram",style: TextStyle(color: Colors.white),)
            //                 ],
            //               ),
            //               Row(
            //                 // crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     padding: EdgeInsets.only(left: 20,),
            //                     child: IconButton(
            //                       onPressed: () {
            //
            //                       },
            //                       icon: Container(
            //                         // alignment: Alignment.centerLeft,
            //                         width: 25,
            //                         height: 20,
            //                         child: Image.asset('images/facebook.png'),
            //                       ),
            //
            //                     ),
            //                   ),
            //                   Text("Facebook",style: TextStyle(color: Colors.white),)
            //                 ],
            //               ),
            //               Row(
            //                 // crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     padding: EdgeInsets.only(left: 20,),
            //                     child: IconButton(
            //                       onPressed: () {
            //
            //                       },
            //                       icon: Container(
            //                         // alignment: Alignment.centerLeft,
            //                         width: 25,
            //                         height: 20,
            //                         child: Image.asset('images/twitter.png'),
            //                       ),
            //
            //                     ),
            //                   ),
            //                   Text("Twitter",style: TextStyle(color: Colors.white),)
            //                 ],
            //               ),
            //               Row(
            //                 // crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     padding: EdgeInsets.only(left: 20,),
            //                     child: IconButton(
            //                       onPressed: () {
            //
            //                       },
            //                       icon: Container(
            //
            //                         // alignment: Alignment.centerLeft,
            //                         width: 25,
            //                         height: 20,
            //                         child: Image.asset('images/message.png'),
            //                       ),
            //
            //                     ),
            //                   ),
            //                   Text("Message",style: TextStyle(color: Colors.white),)
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Container(
            //           padding: EdgeInsets.only(right: 30),
            //           margin: EdgeInsets.symmetric(vertical: 14),
            //           child: FlutterSwitch(
            //             width: 55.0,
            //             height: 20.0,
            //             value: instagramstatus,
            //             valueFontSize: 10.0,
            //             toggleSize: 15.0,
            //             // padding: 1.0,
            //             showOnOff: true,
            //             onToggle: (bool val) {
            //               setState(() {
            //                 instagramstatus = val;
            //               });
            //             },
            //             inactiveColor: Colors.grey, // Color when the switch is inactive (OFF)
            //             activeColor: primaryBg, // Color when the switch is active (ON)
            //             toggleColor: Colors.white,
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.only(right: 30),
            //           margin: EdgeInsets.symmetric(vertical: 14),
            //           child: FlutterSwitch(
            //             width: 55.0,
            //             height: 20.0,
            //             value: facebookstatus,
            //             valueFontSize: 10.0,
            //             toggleSize: 15.0,
            //             // padding: 1.0,
            //             showOnOff: true,
            //             onToggle: (bool val) {
            //               setState(() {
            //                 facebookstatus = val;
            //               });
            //             },
            //             inactiveColor: Colors.grey, // Color when the switch is inactive (OFF)
            //             activeColor: primaryBg,// Color when the switch is active (ON)
            //             toggleColor: Colors.white,
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.only(right: 30),
            //           margin: EdgeInsets.symmetric(vertical: 14),
            //           child: FlutterSwitch(
            //             width: 55.0,
            //             height: 20.0,
            //             value: twitterstatus,
            //             valueFontSize: 10.0,
            //             toggleSize: 15.0,
            //             showOnOff: true,
            //             onToggle: (bool val) {
            //               setState(() {
            //                 twitterstatus = val;
            //               });
            //             },
            //             inactiveColor: Colors.grey, // Color when the switch is inactive (OFF)
            //             activeColor: primaryBg, // Color when the switch is active (ON)
            //             toggleColor: Colors.white,
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.only(right: 30),
            //           margin: EdgeInsets.symmetric(vertical: 14),
            //           child: FlutterSwitch(
            //             width: 55.0,
            //             height: 20.0,
            //             value: messagestatus,
            //             valueFontSize: 10.0,
            //             toggleSize: 15.0,
            //             // padding: 1.0,
            //             showOnOff: true,
            //             onToggle: (bool val) {
            //               setState(() {
            //                 messagestatus = val;
            //               });
            //             },
            //             inactiveColor: Colors.grey, // Color when the switch is inactive (OFF)
            //             activeColor: primaryBg, // Color when the switch is active (ON)
            //             toggleColor: Colors.white,
            //           ),
            //         ),
            //       ],
            //     )
            //
            //   ],
            // ),
            Container(
                margin: EdgeInsets.only(top: 15,right: 30,left: 30),
                padding: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                width: double.infinity,
                child: ElevatedButton(onPressed: () async
                {
                 // Get.toNamed(RouteName.ticketscreen);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NewEventClub()),);
                }, child: Text("Done",style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)

                      )),),
            ),

          ],
        ),
      ),
      // ),
    );
  }
}
