import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/view/event/eventrequest.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../res/app_color.dart';
import '../../res/colors.dart';
import 'democardview.dart';
import 'editeventsscreen.dart';


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
      charges: "200/300" ),
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
        child: Stack(
          children: [
           TicketWidget(
            color: AppColor.lighPrimaryBg,
            width: 350,
            height: 580,
            isCornerRounded: true,
            padding: EdgeInsets.all(20),
             child:   Container(
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
                                  //   Text("Location"),
                                  // Text("Random Address",style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Column(

                                children: <Widget>[
                                  Text("Ticket Sold",style: TextStyle(color: AppColor.greytext),),
                                  Text(car.charges.toString(),style: TextStyle(fontSize: 18),),
                                  // Text("Charges"),
                                  // Text("2000",style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            )
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
                      // ),
                    ],
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
                      bottomsheet2(context);
                    },
                    child: Image.asset("images/info_icon.png",height: 25,),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
    ],
   ),
      ),
    );
  }

  void bottomsheet2(BuildContext context) {
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
                          GestureDetector(onTap: (){
                            showsheet(context);
                          },
                          child:Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(color: AppColor.black70,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Column(children: [
                                Text("Individual",style: TextStyle(color: AppColor.colorwhite),),
                                Text("Male Stag",style: TextStyle(color: AppColor.colorwhite)),
                              ],)

                          ),),
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

  void showsheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (BuildContext builder){
      return StatefulBuilder(builder: (BuildContext context, StateSetter setstate){
        return Container(
          height: 600,
          color: AppColor.colorblack.withOpacity(.70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                        margin: EdgeInsets.only(top: 5, right: 10), // Adjust margin as needed
                        width: 60,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.green53CE94,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "Ticket Info",
                          style: TextStyle(color: AppColor.colorwhite, fontSize: 20),
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
            ],
          ),
        );
      });
    });
  }
}

class PublishEvents extends StatefulWidget {
  @override
  _PublishEvents createState() => _PublishEvents();
}

class _PublishEvents extends State<PublishEvents> {
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
             //    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),);
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