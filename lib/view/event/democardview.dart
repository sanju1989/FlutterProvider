

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/view/event/eventrequest.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../res/app_color.dart';
import '../../res/colors.dart';
import 'democardview.dart';

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

                                Text("Date",),

                                Text("01 September 2023",style: TextStyle(fontSize: 18),),
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
                                Text("00:00 Hrs",style: TextStyle(fontSize: 18),),
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

                                Text("Random Address",style: TextStyle(fontSize: 18),),
                                //   Text("Location"),
                                // Text("Random Address",style: TextStyle(fontSize: 18),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(

                              children: <Widget>[
                                Text("Charges"),
                                Text("2000",style: TextStyle(fontSize: 18),),
                                // Text("Charges"),
                                // Text("2000",style: TextStyle(fontSize: 18),),
                              ],
                            ),
                          )
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
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    // Perform action when the edit button is tapped
                    // For example, navigate to an edit screen
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => EditScreen()),
                    // );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

      ),

    );
  }
}

class DraftedEvents extends StatefulWidget {
  @override
  _DraftedEvents createState() => _DraftedEvents();
}

class _DraftedEvents extends State<DraftedEvents> {
  // List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.signinpage,
      appBar: AppBar(
        backgroundColor: AppColor.signinpage,
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
        title: Center(child: Text("Drafted Events",style: TextStyle(color: Colors.white,fontSize: 30),)),
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