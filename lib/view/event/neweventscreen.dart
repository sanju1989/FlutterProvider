import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:skdoosh/view/event/neweventclub.dart';
import 'package:skdoosh/view_models/event_viewmodel.dart';
import '../../data/response/status.dart';
import '../../res/app_color.dart';
import 'package:provider/provider.dart';
import '../../res/routes/routes_name.dart';
import '../home/notificationdrawer.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({super.key});

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  var _slctdVenue;
  EventViewModel eventViewModel = EventViewModel();
  bool instagramstatus = false;
  bool facebookstatus = false;
  bool twitterstatus = false;
  bool messagestatus = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var evntDurationSlVl;
  var evnttypeSlVl;
  var evntFrqncySlVl;
  var evntVenueSlVl;
  DateTime currentDate = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  String pickedTime = '';
  String timeOfStartDate='';
  String timeOfEndDate='';
  String startDate='';
  String endDate='';
  var imageFile;
  var business_id;

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

  Future _selectTime1(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: timeOfDay);

    if (time != null) {
      setState(() {
        //startTimeOfStartDate = "${time.hour}:${time.minute}";
        _selectTime2(context,time);

      });
    }
  }
  Future _selectTime2(BuildContext context, TimeOfDay startTime) async {
    var endTime = await showTimePicker(context: context, initialTime: startTime);

    if (endTime != null) {
      setState(() {
        timeOfStartDate="${startTime.hour}:${startTime.minute} - ${endTime.hour}:${endTime.minute}";
        debugPrint(timeOfStartDate);
      });
    }
  }

  Future _selectDate(String type) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));

    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        if(type=="Multiple Day"){
          startDate=DateFormat('dd-MM-yyyy').format(pickedDate);
          debugPrint(startDate);
        }
        else{
          endDate=DateFormat('dd-MM-yyyy').format(pickedDate);
          debugPrint(endDate);
        }
      });
  }
  _getUserInfo()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action1 = prefs.getString('business_id');
    final String? action2 = prefs.getString('user_name');
    debugPrint('user-ud=${action1}');
    debugPrint('user-ud=${action2}');
    setState(() {
      business_id=action1.toString();
      Map data={
        "business_id":business_id
      };
      eventViewModel.fetchVenueList(data);
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserInfo();
    evntDurationSlVl = 'Single Day';
    evnttypeSlVl = '1';
    evntFrqncySlVl = '3';
    evntVenueSlVl;

    eventViewModel.fetchEventFrequency();
    eventViewModel.fetchEventType();

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
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.black, size: 30.0)),
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
            Text(
              "Create a new event",
              style: TextStyle(fontSize: 25),
            ),

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
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: 50,
              child: TextField(
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryBg),
                      color: AppColor.colorwhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: DropdownButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      isExpanded: true,
                      items: <String>['Single Day', 'Multiple Day']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: evntDurationSlVl,
                      onChanged: (value) {
                        setState(() {
                          evntDurationSlVl = value.toString();
                        });
                        debugPrint(evntDurationSlVl);
                      },
                    )
                    /*child: TextField(
                      // controller: emailcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Event Duration',
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                      ),
                      keyboardType: TextInputType.text,
                    )*/
                    ),
                if(evntDurationSlVl=="Multiple Day")
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        _selectDate('Multiple Day');
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 15,left: 30),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                          color: AppColor.colorwhite,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 150,
                        height: 50,
                        child: Text('$currentDate'),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        _selectTime1(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 15,right: 30),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                          color: AppColor.colorwhite,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 150,
                        height: 50,
                        child: Text('$startDate'),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // debugPrint(evntDurationSlVl.toString());


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _selectDate('Single Day');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15, left: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryBg),
                      color: AppColor.colorwhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 150,
                    height: 50,
                    child: Text('$endDate'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _selectTime1(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15, right: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryBg),
                      color: AppColor.colorwhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 150,
                    height: 50,
                    child: Text('$timeOfStartDate'),
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 15, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: 50,
                child: ChangeNotifierProvider<EventViewModel>(
                    create: (BuildContext context) => eventViewModel,
                    child:
                    Consumer<EventViewModel>(builder: (context, value, _) {
                      switch (value.venueList.status) {
                        case Status.LOADING:
                          return SizedBox(
                            height: 50,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          );
                        case Status.ERROR:
                          return Text(value.venueList.message.toString());
                        case Status.COMPLETED:
                          debugPrint(
                              value.venueList.data!.data!.length.toString());
                          List<DropdownMenuItem<String>> s = List.generate(
                            value.venueList.data!.data!.length,
                                (index) => DropdownMenuItem(
                              value: value
                                  .venueList.data!.data![index].venueId
                                  .toString(),
                              child: Text(
                                  "${value.venueList.data!.data![index].venueName}"),
                            ),
                          );

                          // _popularMovieList(value);
                          return DropdownButton(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: s,
                            value: _slctdVenue,
                            onChanged: (value) {
                              setState(() {
                                _slctdVenue = value.toString();
                              });
                            },
                          );
                        default:
                          return const Text("Hata");
                      }
                    }))
              /*child: TextField(
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Select Venue',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                ),
                keyboardType: TextInputType.text,
              ),*/
            ),
            Container(
                margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryBg),
                  color: AppColor.colorwhite,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 50,
                child: ChangeNotifierProvider<EventViewModel>(
                    create: (BuildContext context) => eventViewModel,
                    child:
                        Consumer<EventViewModel>(builder: (context, value, _) {
                      //debugPrint(value.cntryList.status.toString());
                      switch (value.evntTypeList.status) {
                        case Status.LOADING:
                          return SizedBox(
                            height: 50,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          );
                        case Status.ERROR:
                          return Text(value.evntTypeList.message.toString());
                        case Status.COMPLETED:
                          debugPrint(
                              value.evntTypeList.data!.data!.length.toString());
                          List<DropdownMenuItem<String>> s = List.generate(
                            value.evntTypeList.data!.data!.length,
                            (index) => DropdownMenuItem(
                              value: value
                                  .evntTypeList.data!.data![index].typeId
                                  .toString(),
                              child: Text(
                                  "${value.evntTypeList.data!.data![index].typeName}"),
                            ),
                          );

                          // _popularMovieList(value);
                          return DropdownButton(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: s,
                            value: evnttypeSlVl,
                            onChanged: (value) {
                              setState(() {
                                evnttypeSlVl = value.toString();
                              });
                            },
                          );
                        default:
                          return const Text("Hata");
                      }
                    }))),

            Container(
                margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryBg),
                  color: AppColor.colorwhite,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 50,
                child: ChangeNotifierProvider<EventViewModel>(
                    create: (BuildContext context) => eventViewModel,
                    child:
                        Consumer<EventViewModel>(builder: (context, value, _) {
                      //debugPrint(value.cntryList.status.toString());
                      switch (value.eventFrequencyList.status) {
                        case Status.LOADING:
                          return SizedBox(
                            height: 50,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          );
                        case Status.ERROR:
                          return Text(
                              value.eventFrequencyList.message.toString());
                        case Status.COMPLETED:
                          debugPrint(value.eventFrequencyList.data!.data!.length
                              .toString());
                          List<DropdownMenuItem<String>> s = List.generate(
                            value.eventFrequencyList.data!.data!.length,
                            (index) => DropdownMenuItem(
                              value: value.eventFrequencyList.data!.data![index]
                                  .frequencyId
                                  .toString(),
                              child: Text(
                                  "${value.eventFrequencyList.data!.data![index].frequency}"),
                            ),
                          );

                          // _popularMovieList(value);
                          return DropdownButton(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: s,
                            value: evntFrqncySlVl,
                            onChanged: (value) {
                              setState(() {
                                evntFrqncySlVl = value.toString();
                              });
                            },
                          );
                        default:
                          return const Text("Hata");
                      }
                    }))),
            Container(
              margin: EdgeInsets.only(top: 15, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryBg),
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
                margin: EdgeInsets.only(top: 15, right: 30, left: 30),
                padding: EdgeInsets.symmetric(vertical: 5),
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Get.toNamed(RouteName.ticketscreen);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => NewEventClub()),);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))
                  ),
                )),
          ],
        ),
      ),
      // ),
    );
  }
}
