import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/view/home/pastevents.dart';

import '../../res/routes/routes_name.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 105,
                  width: 85,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.signincolor,
                      borderRadius: BorderRadius.circular(50.0)),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    IconButton(onPressed: (){
                      Get.toNamed(RouteName.createEvent);
                    },
                      icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),),
                      // Icon(
                      //   Icons.add,
                      //   color: AppColor.black303030,
                      //   size: 40,
                      // ),
                      Text(
                        'New Event',
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteName.eventrequest);
                  },
                  child: Container(
                    height: 155,
                    width: 185,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColor.lighPrimaryBg,
                        borderRadius: BorderRadius.circular(60.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: [
                                Text("70",style: TextStyle
                                  (fontSize: 40,fontFamily: "FontInter",color: AppColor.coloreventrequest),),
                                Text("Requested",style: TextStyle
                                  (fontSize: 8,fontFamily: "FontInter",color: Colors.black),)
                              ],
                            ),
                  Container(
                          height: 50, 
                          width: 1,
                          color: AppColor.aligncolor,),
                            Column(
                              children: [
                                Text("25",style: TextStyle
                                  (fontSize: 40,fontFamily: "FontInter",color: AppColor.colorsavedrequest),),
                                Text("Saved",style: TextStyle
                                  (fontSize: 8,fontFamily: "FontInter",color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                        Text("Unpublished Event",style: TextStyle
                          (fontSize: 10,fontFamily: "FontInter",color: Colors.black))
                      ],
                    ),
                    // child: Column(
                    //   children: [
                    //
                    //     // SizedBox(
                    //     //   height: 125,
                    //     //   child: ListView(
                    //     //     children: const <Widget>[
                    //     //       SizedBox(
                    //     //         height: 35,
                    //     //         child: Center(
                    //     //             child: Text(
                    //     //           'Item 1',
                    //     //           style:
                    //     //               TextStyle(fontSize: 11, color: Colors.black),
                    //     //         )),
                    //     //       ),
                    //     //       SizedBox(
                    //     //         height: 35,
                    //     //         child: Center(
                    //     //             child: Text(
                    //     //           'Item 1',
                    //     //           style:
                    //     //               TextStyle(fontSize: 11, color: Colors.black),
                    //     //         )),
                    //     //       ),
                    //     //       SizedBox(
                    //     //         height: 35,
                    //     //         child: Center(
                    //     //             child: Text(
                    //     //           'Item 1',
                    //     //           style:
                    //     //               TextStyle(fontSize: 11, color: Colors.black),
                    //     //         )),
                    //     //       ),
                    //     //     ],
                    //     //   ),
                    //     // ),
                    //     Text(
                    //       "Unpublished Event",
                    //       style: TextStyle(
                    //           color: AppColor.black303030,
                    //           fontSize: 11,
                    //           fontWeight: FontWeight.w400),
                    //     )
                    //   ],
                    // ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.publishevent);
                  },
                  child: Container(
                    height: 115,
                    width: 85,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColor.signinpage,
                        borderRadius: BorderRadius.circular(35.0)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('images/ic_icon_draft_event.png'),
                          height: 80,
                          width: 40,
                        ),
                        Text(
                          'Published Event',
                          style: TextStyle(
                              fontSize: 9.5,
                              color: AppColor.black303030,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 155,
                  width: 180,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.signincolor,
                      borderRadius: BorderRadius.circular(60.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "MONTH",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Image(
                        image: AssetImage('images/ic_icon_calendar_event.png'),
                        height: 90,
                        width: 95,
                      ),
                      Text(
                        "Event Calendar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: (){
                Navigator.push((context), MaterialPageRoute(builder: (context)=> PastEvents()));
              },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Past Event',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Icon(Icons.arrow_forward),
              ],
            ),),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  SizedBox(
                    height: 35,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item 1',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                'Mon, 13 sept 23',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          Spacer(),
                          Text(
                            '\$10000',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_forward_ios,size: 20,),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 35,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item 1',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                'Mon, 13 sept 23',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          Spacer(),
                          Text(
                            '\$10000',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_forward_ios,size: 20,),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 35,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item 1',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                'Mon, 13 sept 23',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          Spacer(),
                          Text(
                            '\$10000',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_forward_ios,size: 20,),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
