import 'package:flutter/material.dart';
import 'package:skdoosh/view/history/daywise.dart';

import '../../res/app_color.dart';
import '../../utils/calendar/flutter_neat_and_clean_calendar.dart';
class ClubwiseScreen extends StatefulWidget {
  const ClubwiseScreen({super.key});

  @override
  State<ClubwiseScreen> createState() => _ClubwiseScreenState();
}

class _ClubwiseScreenState extends State<ClubwiseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Club-wise",style: TextStyle(color: AppColor.primaryBg,fontFamily: "FontInter"),),
              PopupMenuButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down,color: AppColor.primaryBg,),
                  onSelected: (String value){
                    if (value == "Daywise") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DayWise()),

                      );
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                        value: "Daywise",
                        child: Text("Day-wise",
                          style: TextStyle(color: AppColor.primaryBg,fontFamily: "FontInter"),)
                    ),
                    PopupMenuItem<String>(
                        value: "Clubwise",
                        child: Text("Club-wise",
                          style: TextStyle(color: AppColor.primaryBg,fontFamily: "FontInter"),)),
                  ]),
            ],
          ),
          Padding(padding: EdgeInsets.all(8.0),
          child:Container(
            width: 250,
            height: 100,
            decoration: BoxDecoration(color: AppColor.containercolor,
            borderRadius: BorderRadius.circular(50)),
            child: Align(alignment: Alignment.center,
            child:Text("Electro Haven",textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,fontFamily: "FontInter",fontWeight: FontWeight.w400),),),
          ),),

          SizedBox(
            height: 150, // Adjust the height according to your layout
            child: Calendar(
              startOnMonday: true,
              weekDays: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
              selectedColor: AppColor.lighPrimaryBg,
              selectedTodayColor: AppColor.primaryBg,
              displayMonthTextStyle:TextStyle(color: AppColor.primaryBg,fontFamily: "FonteInter",fontSize: 20),
              dayOfWeekStyle: TextStyle(
                color: AppColor.primaryBg,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const <Widget>[
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Electro-Heaven',
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                        Text(
                          'Rusty Notes',
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                        Text(
                          'Total Revenue',
                          style: TextStyle(fontSize: 20, color: AppColor.primaryBg),
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

              ],
            ),
          )
        ],
      ),


    );
  }
}
