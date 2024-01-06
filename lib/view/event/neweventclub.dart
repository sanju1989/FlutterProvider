
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/view/event/editeventsscreen.dart';
import 'package:skdoosh/view/event/eventrequest.dart';
import 'package:skdoosh/view/event/publishevent.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../res/app_color.dart';
import '../../res/colors.dart';
import 'democardview.dart';

class NewEvent {
  NewEvent({required this.date, required this.time, required this.location, required this.charges});

  String date;
  String time;
  String location;
  String charges;
}

var cars = [
  NewEvent(
      date: '01 Sept 2023',
      time: '7:00 Hrs',
      location: "Hub",
      charges: "2000" ),
  NewEvent(
      date: '04 Sept 2023',
      time: '8:00 Hrs',
      location: "Chandigarh",
      charges: "500" ),
  NewEvent(
      date: '08 Sept 2023',
      time: '9:00 Hrs',
      location: "Panchkula",
      charges: "1000" ),
  NewEvent(
      date: '10 Sept 2023',
      time: '10:00 Hrs',
      location: "Zirakpur",
      charges: "2500" ),
  NewEvent(
      date: '15 Sept 2023',
      time: '12:00 Hrs',
      location: "Malldives",
      charges: "\$200" ),
  NewEvent(
      date: '20 Sept 2023',
      time: '02:00 Hrs',
      location: "Canada",
      charges: "\$500" ),
];

// ignore: must_be_immutable
class CarouselCard extends StatelessWidget {
  CarouselCard({required this.car});

  NewEvent car;

  @override
  Widget build(BuildContext context) {
    return Center(
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
              children:<Widget> [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/clubparty_logo.png",),
                ),
                Text("EVENT LOREM IPSUM",style: TextStyle(color: ipsum, fontSize: 20),),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Text("Date",),
                //         ),
                //         Text("01 September 2023",),
                //
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Text("Location"),
                //         ),
                //         Text("01 Random Addreess,\n Random city",),
                //       ],
                //     ),
                //     Column(
                //
                //       children: <Widget>[
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Text("Time"),
                //         ),
                //         Text("21:00 Hrs",),
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Text("Charges"),
                //         ),
                //         Text("2000",),
                //       ],
                //     )
                //   ],
                // )
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

                            Text("Date",),

                            Text(car.date.toString(),style: TextStyle(fontSize: 18),),
                            //   Text("Location"),
                            // Text("Random Address",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(

                          children: <Widget>[
                            Text("Time"),
                            Text(car.time.toString(),style: TextStyle(fontSize: 18),),
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

                            Text("Location",),

                            Text(car.location.toString(),style: TextStyle(fontSize: 18),),
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
                      //       Text(car.charges.toString(),style: TextStyle(fontSize: 18),),
                      //       // Text("Charges"),
                      //       // Text("2000",style: TextStyle(fontSize: 18),),
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
                   //  Navigator.push(context, MaterialPageRoute(builder: (context) =>EditEventScreen()));
                   },
                   child: Icon(Icons.edit_outlined,color: Colors.white,),
                   backgroundColor: AppColor.colorblack,
                 ),
               ),
             ),
           ),
       ],)
      ),
    );
  }
}

class NewEventClub extends StatefulWidget {
  @override
  _NewEventClub createState() => _NewEventClub();
}

class _NewEventClub extends State<NewEventClub> {
  // List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row();
  }

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
            icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30.0
            )),
        title: Center(child: Text("Create a new event",style: TextStyle(color: Colors.white,fontSize: 30),)),
      ),
      body: Column(
        children: <Widget>[
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
            // padding: EdgeInsets.only(top: 30),
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
          Spacer(),
        ],
      ),
    );
  }
}
