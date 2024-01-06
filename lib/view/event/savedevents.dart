import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/view/event/eventrequest.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../res/app_color.dart';
import '../../res/colors.dart';
import 'democardview.dart';

class TeslaCar {
  String date;
  String time;
  String location;
  String charges;


  TeslaCar({required this.date, required this.time, required this.location, required this.charges});
}

var cars = [
  TeslaCar(
      date: '01 Sept 2023',
      time: '7:00 Hrs',
      location: "Hub",
      charges: "2000" ),
  TeslaCar(
      date: '04 Sept 2023',
      time: '8:00 Hrs',
      location: "Chandigarh",
      charges: "500" ),
  TeslaCar(
      date: '08 Sept 2023',
      time: '9:00 Hrs',
      location: "Panchkula",
      charges: "1000" ),
  TeslaCar(
      date: '10 Sept 2023',
      time: '10:00 Hrs',
      location: "Zirakpur",
      charges: "2500" ),
  TeslaCar(
      date: '15 Sept 2023',
      time: '12:00 Hrs',
      location: "Malldives",
      charges: "\$200" ),
  TeslaCar(
      date: '20 Sept 2023',
      time: '02:00 Hrs',
      location: "Canada",
      charges: "\$500" ),
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
          // child: TicketWidget(
          //   width: 350,
          //   height: 580,
          //   isCornerRounded: true,
          //   padding: EdgeInsets.all(20),
          //   child: Container(
          //     child: Column(
          //       children:<Widget> [
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Image.asset("images/clubparty_logo.png",),
          //         ),
          //         Text("EVENT LOREM IPSUM",style: TextStyle(color: ipsum, fontSize: 20),),
          //
          //         Container(
          //           margin: EdgeInsets.only(top: 20),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(4.0),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: <Widget>[
          //
          //                     Text("Date",),
          //
          //                     Text("01 September 2023",style: TextStyle(fontSize: 18),),
          //                     //   Text("Location"),
          //                     // Text("Random Address",style: TextStyle(fontSize: 18),),
          //                   ],
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.all(1.0),
          //                 child: Column(
          //
          //                   children: <Widget>[
          //                     Text("Time"),
          //                     Text("00:00 Hrs",style: TextStyle(fontSize: 18),),
          //                     // Text("Charges"),
          //                     // Text("2000",style: TextStyle(fontSize: 18),),
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //         Container(
          //           margin: EdgeInsets.only(top: 20),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(4.0),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: <Widget>[
          //
          //                     Text("Location",),
          //
          //                     Text("Random Address",style: TextStyle(fontSize: 18),),
          //                     //   Text("Location"),
          //                     // Text("Random Address",style: TextStyle(fontSize: 18),),
          //                   ],
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.all(1.0),
          //                 child: Column(
          //
          //                   children: <Widget>[
          //                     Text("Charges"),
          //                     Text("2000",style: TextStyle(fontSize: 18),),
          //                     // Text("Charges"),
          //                     // Text("2000",style: TextStyle(fontSize: 18),),
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(5.0),
          //           child: Container(
          //             margin: EdgeInsets.only(top: 20),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children:<Widget> [
          //                 IconButton(onPressed: (){
          //
          //                 }, icon:Image.asset("images/purpleinsta.png"), ),
          //
          //                 IconButton(onPressed: (){
          //
          //                 }, icon:Image.asset("images/purplefacebook.png"), ),
          //
          //                 IconButton(onPressed: (){
          //
          //                 }, icon:Image.asset("images/purpletwitter.png"), ),
          //
          //                 IconButton(onPressed: (){
          //
          //                 }, icon:Image.asset("images/purplemessage.png"), ),
          //                 // Image.asset("images/purpleinsta.png",),
          //                 // Image.asset("images/purplefacebook.png"),
          //                 // Image.asset("images/purpletwitter.png"),
          //                 // Image.asset("images/purplemessage.png"),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          child: TicketWidget(
            width: 350,
            height: 580,
            isCornerRounded: true,
            padding: EdgeInsets.all(20),
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children:<Widget> [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("images/clubparty_logo.png",),
                      ),
                      Text("EVENT LOREM IPSUM",style: TextStyle(color: ipsum, fontSize: 20),),

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

                                  Text("Date",style: TextStyle(color: AppColor.greytext)),

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
                                  Text("Time",style: TextStyle(color: AppColor.greytext)),
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

                                  Text("Location",style: TextStyle(color: AppColor.greytext)),

                                  Text(car.location.toString(),style: TextStyle(fontSize: 18),),

                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(1.0),
                            //   child: Column(
                            //
                            //     children: <Widget>[
                            //       Text("Charges",style: TextStyle(color: AppColor.greytext)),
                            //       Text(car.charges.toString(),style: TextStyle(fontSize: 18),),
                            //       // Text("Charges"),
                            //       // Text("2000",style: TextStyle(fontSize: 18),),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:<Widget> [
                              IconButton(onPressed: (){

                              }, icon:Image.asset("images/purpleinsta.png"), ),

                              IconButton(onPressed: (){

                              }, icon:Image.asset("images/purplefacebook.png"), ),

                              IconButton(onPressed: (){

                              }, icon:Image.asset("images/purpletwitter.png"), ),

                              IconButton(onPressed: (){

                              }, icon:Image.asset("images/purplemessage.png"), ),
                              // Image.asset("images/purpleinsta.png",),
                              // Image.asset("images/purplefacebook.png"),
                              // Image.asset("images/purpletwitter.png"),
                              // Image.asset("images/purplemessage.png"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                // bottom: 10,
                // right: 1,
                // child: Padding(
                //   padding: const EdgeInsets.all(1),
                //   child: FloatingActionButton(
                //   onPressed: () {
                //
                //   },
                //   child: Icon(Icons.ios_share),
                //   backgroundColor: Colors.white, // Customize the button color
                //   ),
                // ),),
                //             Positioned(
                //               bottom: 10,
                //               right: 1,
                //               child: GestureDetector(
                //                 onTap: () {
                //                 },
                //                 child: Container(
                //                   padding: EdgeInsets.only(left: 60),
                //                   // margin: EdgeInsets.all(1),
                //                   decoration: BoxDecoration(
                //                     color: Colors.white,
                //                     borderRadius: BorderRadius.circular(20),
                //                   ),
                //                   child: Icon(
                //                     Icons.ios_share,
                //                     color: Colors.black,
                //                   ),
                //                 ),
                //               ),
                //             ),
              ],
            ),
          )

      ),

    );
  }
}

class SavedEvents extends StatefulWidget {
  @override
  _SavedEvents createState() => _SavedEvents();
}

class _SavedEvents extends State<SavedEvents> {
  // List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.singupcolor,
      appBar: AppBar(
        backgroundColor: AppColor.singupcolor,
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
        title: Center(child: Text("Published Events",style: TextStyle(color: Colors.white,fontSize: 30),)),
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
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.only(left: 50,right: 40),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PublishEvent()),);
              },
              child: Text(
                'Delete',
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