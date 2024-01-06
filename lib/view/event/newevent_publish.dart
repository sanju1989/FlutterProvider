import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/view/event/publishevent.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../res/app_color.dart';
import '../../res/colors.dart';
import '../../utils/swipe_card/example_card.dart';
import 'eventrequest.dart';

class NewEventPublish extends StatefulWidget {
  const NewEventPublish({super.key});

  @override
  State<NewEventPublish> createState() => _NewEventPublishState();
}

class _NewEventPublishState extends State<NewEventPublish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clubolor,
      appBar: AppBar(
        backgroundColor: clubolor,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios,
                color: Colors.white, size: 30.0)),
        title: Center(
            child: Text(
          "Create a new event",
          style: TextStyle(color: Colors.white, fontSize: 30),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(
                      // top: 32.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Stack(
                      children: [
                        TicketWidget(
                          width: 350,
                          height: 580,
                          isCornerRounded: true,
                          padding: EdgeInsets.all(20),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "images/clubparty_logo.png",
                                  ),
                                ),
                                Text(
                                  "EVENT LOREM IPSUM",
                                  style: TextStyle(color: ipsum, fontSize: 20),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Date",
                                            ),
                                            Text(
                                              "car.date.toString()",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text("Time"),
                                            Text(
                                              "car.time.toString()",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            // Text("Charges"),
                                            // Text("2000",style: TextStyle(fontSize: 18),),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Location",
                                            ),

                                            Text(
                                             " car.location.toString()",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            //   Text("Location"),
                                            // Text("Random Address",style: TextStyle(fontSize: 18),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: FloatingActionButton(
                                onPressed: () {
                                  // Add your onPressed functionality here
                                },
                                child: Image.asset(
                                  "images/info_icon.png",
                                  height: 25,
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: FloatingActionButton(
                                onPressed: () {
                                  //  Navigator.push(context, MaterialPageRoute(builder: (context) =>EditEventScreen()));
                                },
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                ),
                                backgroundColor: AppColor.colorblack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 20.0,bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EventRequest()),);
                        // Handle button 1 press
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 12, color: AppColor.blackcolor),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.homecolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PublishEvents()),);
                      },
                      child: Text(
                        'Publish',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.blackcolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}