import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/view/history/daywise.dart';
import 'package:skdoosh/view/home/revenuehistory.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
      Padding(
         padding: const EdgeInsets.all(18.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 120,
              height: 40,
              child: TextField(
                style: TextStyle(color: AppColor.colorblack),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'DD/MM/YYYY ',
                ),
              ),
            ),
              Container(
                width: 10,
                height: 2,
                decoration: BoxDecoration(color: AppColor.colorblack),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                  color: AppColor.colorwhite,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 120,
                height: 40,
                child: TextField(
                  style: TextStyle(color: AppColor.colorblack),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'DD/MM/YYYY ',
                  ),
                ),
              ),
          ],),
      ),

          // Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: Container(
          //     margin: EdgeInsets.all(12.0),
          //     height: 90,
          //     width: 190,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30),
          //         shape: BoxShape.rectangle,
          //         color: AppColor.lighPrimaryBg),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Text(
          //           textAlign: TextAlign.left,
          //           'Account Balance',
          //           style: TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w500,
          //               color: Colors.black),
          //         ),
          //         Text(
          //           '\$ 89,9090',
          //           style: TextStyle(
          //               color: Colors.black,
          //               fontSize: 18,
          //               fontWeight: FontWeight.w400),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: (){
          //    Navigator.push(context, MaterialPageRoute(builder: (context)=>DayWise()),);
            },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Venue Name',
                  style: TextStyle(color: AppColor.primaryBg, fontSize: 25),
                ),
              ),
              Icon(Icons.keyboard_arrow_down,color: AppColor.primaryBg),
            ],
          ),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Total Revenue',
                  style: TextStyle(color: AppColor.colorblack, fontSize: 12,
                      fontWeight: FontWeight.w200,fontFamily: "FontInter"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  '\$ 22,222.00',
                  style: TextStyle(color: AppColor.primaryBg, fontSize: 25,
                      fontWeight: FontWeight.w200,fontFamily: "FontInter"),
                ),
              ),
             // Icon(Icons.keyboard_arrow_down,color: AppColor.primaryBg),
            ],
          ),

          Divider(),
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
                              'Venue 1',
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
                              'Venue 2',
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
        ],
      ),
    );
  }
}
