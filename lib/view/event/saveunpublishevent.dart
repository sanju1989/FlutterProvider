
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/view/event/eventrequest.dart';
import 'package:skdoosh/view/event/savedevents.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../res/app_color.dart';
import '../../res/colors.dart';
import 'democardview.dart';
import 'editeventsscreen.dart';

class TeslaCar {
  TeslaCar({required this.model, required this.image, required this.description});

  String model;
  String image;
  String description;
}

var cars = [
  TeslaCar(
      model: 'Roadster',
      image: 'images/clubparty_logo.png',
      description:
      'As an all-electric supercar, Roadster maximizes the potential of aerodynamic engineering—with record-setting performance and efficiency.'),
  TeslaCar(
      model: 'Model S',
      image: 'https://wallpapershome.com/images/pages/pic_v/8763.jpeg',
      description:
      "Model S sets an industry standard for performance and safety. Tesla’s all-electric powertrain delivers unparalleled performance in all weather conditions."),
  TeslaCar(
      model: 'Model 3',
      image: 'https://wallpapershome.com/images/pages/ico_v/20707.jpg',
      description:
      "Model 3 comes with the option of dual motor all-wheel drive, 20” Performance Wheels and Brakes and lowered suspension for total control, in all weather conditions."),
  TeslaCar(
      model: 'Model X',
      image:
      'https://images.hdqwalls.com/download/tesla-model-x-front-4k-5x-1080x1920.jpg',
      description:
      "Tesla’s all-electric powertrain delivers Dual Motor All-Wheel Drive, adaptive air suspension and the quickest acceleration of any SUV on the road—from zero to 60 mph in 2.6 seconds."),
  TeslaCar(
      model: 'Model Y',
      image:
      'https://www.autocar.co.uk/sites/autocar.co.uk/files/images/car-reviews/first-drives/legacy/model_y_front_34_blue.jpg',
      description:
      "Tesla All-Wheel Drive has two ultra-responsive, independent electric motors that digitally control torque to the front and rear wheels—for far better handling, traction and stability."),
  TeslaCar(
      model: 'Cyber Truck',
      image: 'https://img.wallpapersafari.com/phone/750/1334/65/24/BAlZne.jpg',
      description:
      "The powerful drivetrain and low center of gravity provides extraordinary traction control and torque—enabling acceleration from 0-60 mph in as little as 2.9 seconds."),
];

// ignore: must_be_immutable
class CarouselCard extends StatelessWidget {
  CarouselCard({required this.car});

  TeslaCar car;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          // top: 32.0,
          left: 8.0,
          right: 8.0,
        ),
        child: Stack(children: [
          TicketWidget(
            color: AppColor.colorwhite,
            width: 350,
            height: 580,
            isCornerRounded: true,
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("images/clubparty_logo.png",),
                  ),
                  Text("EVENT LOREM IPSUM",style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: "FontInter"),),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text("Date",style: TextStyle(color: AppColor.primaryBg)),

                              Text("01 September 2023",style: TextStyle(fontSize: 10,color: Colors.black),),
                              //   Text("Location"),
                              // Text("Random Address",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Column(

                            children: <Widget>[
                              Text("Time",style: TextStyle(color: AppColor.primaryBg),),
                              Text("00:00 Hrs",style: TextStyle(fontSize: 10,color: Colors.black),),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text("Location",style: TextStyle(color: AppColor.primaryBg),),

                              Text("Random Address",style: TextStyle(fontSize: 18,color: Colors.black),),
                              //   Text("Location"),
                              // Text("Random Address",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(1.0),
                        //   child: Column(
                        //
                        //     children: <Widget>[
                        //       Text("Charges"),
                        //       Text("2000",style: TextStyle(fontSize: 18),),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(5.0),
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: 20),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children:<Widget> [
                  //         IconButton(onPressed: (){
                  //
                  //         }, icon:Image.asset("images/purpleinsta.png"), ),
                  //
                  //         IconButton(onPressed: (){
                  //
                  //         }, icon:Image.asset("images/purplefacebook.png"), ),
                  //
                  //         IconButton(onPressed: (){
                  //
                  //         }, icon:Image.asset("images/purpletwitter.png"), ),
                  //
                  //         IconButton(onPressed: (){
                  //
                  //         }, icon:Image.asset("images/purplemessage.png"), ),
                  //         // Image.asset("images/purpleinsta.png",),
                  //         // Image.asset("images/purplefacebook.png"),
                  //         // Image.asset("images/purpletwitter.png"),
                  //         // Image.asset("images/purplemessage.png"),
                  //       ],
                  //     ),
                  //   ),
                  // )

                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
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
                  child: Icon(Icons.delete_outline),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: 40,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: FloatingActionButton(
                  onPressed: () {
                    // Add your onPressed functionality here
                  },
                  child: Icon(Icons.ios_share),
                  backgroundColor: Colors.white,
                ),
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
                    bottomsheet3(context);
                  },
                  child: Image.asset("images/info_icon.png",height: 25,),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditEventScreen()));                  },
                  child: Icon(Icons.edit_outlined,color: Colors.black,),
                  backgroundColor: AppColor.colorwhite,
                ),
              ),
            ),
          ),
        ],),
      ),

    );
  }

  void bottomsheet3(BuildContext context) {
    showModalBottomSheet(context: context, builder: (BuildContext builder){
      return StatefulBuilder(builder: (BuildContext context, StateSetter setstate){
        return Container(
          height: 600,
          color: AppColor.colorblack.withOpacity(.70),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child:
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "Event Info",
                          style: TextStyle(color: AppColor.colorwhite, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, right: 10), // Adjust margin as needed
                    width: 60,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditEventScreen()));
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.green53CE94,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Divider(color: AppColor.colorwhite,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Name",
                                    style: TextStyle(color: AppColor.colorwhite, fontSize: 18),
                                  ),
                                  Text(
                                    "Loreum Ipsum Events",
                                    style: TextStyle(fontSize: 10, color: AppColor.colorwhite),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Author",
                                    style: TextStyle(color: AppColor.colorwhite, fontSize: 18),
                                  ),
                                  Text(
                                    "Atul Sharma",
                                    style: TextStyle(fontSize: 10, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Venue
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Venue",
                                    style: TextStyle(color: AppColor.colorwhite, fontSize: 18),
                                  ),
                                  Text(
                                    "Loreum Ipsum Events",
                                    style: TextStyle(fontSize: 10, color: AppColor.colorwhite),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Date",
                                    style: TextStyle(color: AppColor.colorwhite, fontSize: 18),
                                  ),
                                  Text(
                                    "dd mm yyyy",
                                    style: TextStyle(fontSize: 10, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Event Type
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Event Type",
                                    style: TextStyle(color: AppColor.colorwhite, fontSize: 18),
                                  ),
                                  Text(
                                    "Loreum Ipsum Events",
                                    style: TextStyle(fontSize: 10, color: AppColor.colorwhite),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child:  Text(
                                      "Description",
                                      style: TextStyle(color: AppColor.colorwhite, fontSize: 18),
                                    ),),
                                  Container(
                                    // margin: EdgeInsets.only(top: 10),
                                    child:  Text(
                                      "Loreum Ipsum Events",
                                      style: TextStyle(color: AppColor.colorwhite, fontSize: 10),
                                    ),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Time",
                                    style: TextStyle(color: AppColor.colorwhite, fontSize: 18),
                                  ),
                                  Text(
                                    "Atul Sharma",
                                    style: TextStyle(fontSize: 10, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),


                  Divider(color: Colors.white,),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("Ticket : 2000",style: TextStyle(color: Colors.white,
                            fontSize: 18,fontFamily: "FontInter", fontWeight: FontWeight.w300),),),
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(color: AppColor.black70,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Column(children: [
                                Text("Individual",style: TextStyle(color: AppColor.colorwhite),),
                                Text("Male Stag",style: TextStyle(color: AppColor.colorwhite)),
                              ],)

                          ),
                          Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(color: AppColor.black70,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Column(children: [
                                Text("Individual",style: TextStyle(color: AppColor.colorwhite)),
                                Text("Male Stag",style: TextStyle(color: AppColor.colorwhite)),
                              ],)

                          ),
                          Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(color: AppColor.black70,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Column(children: [
                                Text("Individual",style: TextStyle(color: AppColor.colorwhite)),
                                Text("Male Stag",style: TextStyle(color: AppColor.colorwhite)),
                              ],)

                          ),
                        ],),
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(color: AppColor.black70,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Column(children: [
                                Text("Individual",style: TextStyle(color: AppColor.colorwhite),),
                                Text("Male Stag",style: TextStyle(color: AppColor.colorwhite)),
                              ],)

                          ),
                          Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(color: AppColor.black70,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Column(children: [
                                Text("Individual",style: TextStyle(color: AppColor.colorwhite)),
                                Text("Male Stag",style: TextStyle(color: AppColor.colorwhite)),
                              ],)

                          ),
                          Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(color: AppColor.black70,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Column(children: [
                                Text("Individual",style: TextStyle(color: AppColor.colorwhite)),
                                Text("Male Stag",style: TextStyle(color: AppColor.colorwhite)),
                              ],)

                          ),
                        ],)
                    ],)

                ],),

            ],
          ),

        );
      });
    });
  }
}

class SaveUnpublishEvent extends StatefulWidget {
  @override
  _SaveUnpublishEvent createState() => _SaveUnpublishEvent();
}

class _SaveUnpublishEvent extends State<SaveUnpublishEvent> {
  // List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBg,
      appBar: AppBar(
        backgroundColor: AppColor.primaryBg,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30.0
            )),
        title: Center(child: Text("Unpublished Event",style: TextStyle(color: Colors.white,fontSize: 30),)),
      ),
      body: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Saved Event",style: TextStyle(color: Colors.white),),
                PopupMenuButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down, color: AppColor.colorwhite),
                  onSelected: (String? value) {
                    if (value == "Requested Events") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EventRequest()),
                      );
                    } else if (value == "Saved Events") {
                      // Handle 'Saved Events' action
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: "Requested Events",
                      child: Text(
                        "Requested Events",
                        style: TextStyle(color: AppColor.primaryBg, fontFamily: "FontInter"),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: "Saved Events",
                      child: Text(
                        "Saved Events",
                        style: TextStyle(color: AppColor.primaryBg, fontFamily: "FontInter"),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return Opacity(
                  opacity: currentPage == index ? 1.0 : 0.8,
                  child: CarouselCard(
                    car: cars[index],
                  ),
                );
              },
              itemCount: cars.length,
              controller:
              PageController(initialPage: 0, viewportFraction: 0.75),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          updateIndicators(),
          Spacer(),
          Container(
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.only(left: 50,right: 40),
            child: ElevatedButton(
              onPressed: () {
                //    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),);
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
          Spacer(),
        ],
      ),
    );
  }
}
