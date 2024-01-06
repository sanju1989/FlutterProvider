import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';

import '../../res/app_color.dart';
//import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(

    home: RevenueHistory(),
  );
}

class RevenueHistory extends StatefulWidget {
  @override
  _RevenueHistory createState() => _RevenueHistory();
}

class _RevenueHistory extends State<RevenueHistory> {
  final CalendarWeekController _controller = CalendarWeekController();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      title: Text("History",style: TextStyle(color: Colors.black,fontSize: 25,fontFamily: "FontInter"),),
      centerTitle: true,
      elevation: 0,
    ),
    body: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.end,
        children: [
      Text("Club-wise"),
      IconButton(onPressed: (){

      }, icon: Icon(Icons.keyboard_arrow_down)),],),
      Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 0,
                spreadRadius: 0)
          ]),

          child: CalendarWeek(
            controller: _controller,
            height: 100,
            showMonth: true,
            minDate: DateTime.now().add(
              Duration(days: -365),
            ),

            maxDate: DateTime.now().add(
              Duration(days: 365),
            ),
            onDatePressed: (DateTime datetime) {
              setState(() {});
            },
            onDateLongPressed: (DateTime datetime) {

            },
            onWeekChanged: () {

            },
            dayOfWeekStyle:
            TextStyle(color: AppColor.primaryBg, fontWeight: FontWeight.w600),
           // dayOfWeekAlignment: FractionalOffset.bottomCenter,
            dateStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            //dateAlignment: FractionalOffset.topCenter,
            todayDateStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            pressedDateStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            pressedDateBackgroundColor: AppColor.colorlightpurple,
            todayBackgroundColor: AppColor.primaryBg,
           // dateBackgroundColor: Colors.black,
            backgroundColor: Colors.white,
            dayOfWeek: ['M', 'T', 'W', 'T', 'F', 'S', 'S',],
           // spaceBetweenLabelAndDate: 0,
            dayShapeBorder: BoxShape.circle,
            monthViewBuilder: (DateTime time) => Align(
              alignment: FractionalOffset.center,
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMM().format(time),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, fontFamily: "FontInter"),
                  )),
            ),

            decorations: [
              // DecorationItem(
              //     decorationAlignment: FractionalOffset.bottomRight,
              //     date: DateTime.now(),
              //     decoration: Icon(
              //       Icons.today,
              //       color: Colors.black,
              //     )),
              DecorationItem(
                  date: DateTime.now().add(Duration(days: 3)),
                  decoration: Text(
                    '80k',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          )),
      Expanded(
        child: ListView(
          children: const <Widget>[
            SizedBox(
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Electro Heaven',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        // Text(
                        //   'Mon, 13 sept 23',
                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w300,
                        //       color: Colors.black),
                        // )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child:  Text(
                        '\$10000',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rusty Notes',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        // Text(
                        //   'Rusty Notes',
                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w300,
                        //       color: Colors.black),
                        // )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child:  Text(
                        '\$10000',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Venue 3',
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child:  Text(
                        '\$10000',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Venue 4',
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child:  Text(
                        '\$10000',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
          ],
        ),
      )

    ]),
  );
}
