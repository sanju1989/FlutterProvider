import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/res/routes/routes_name.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('Staff'),
          leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: Container(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.createSupervisor);
                    },
                    child: Container(
                      height: 100,
                      width: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColor.lighPrimaryBg1,
                          borderRadius: BorderRadius.circular(40.0)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColor.black303030,
                                size: 30,
                              ),
                              Image(
                                image: AssetImage(
                                    'images/ic_staff_supervisor1.png'),
                                height: 55,
                                width: 55,
                              )
                            ],
                          ),
                          Text(
                            'Create Employees',
                            style: TextStyle(
                                fontSize: 11.0,
                                color: AppColor.black303030,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.allStaffScreen);
                    },
                    child: Container(
                        height: 65,
                        width: 185,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColor.lighPrimaryBg,
                            borderRadius: BorderRadius.circular(60.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Image(
                            image: AssetImage('images/ic_staff_all_star.png'),
                          ),
                        )),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.supervisorscreen);
                    },
                    child: Container(
                      height: 100,
                      width: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColor.signinpage,
                          borderRadius: BorderRadius.circular(35.0)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/ic_staff_supervisor2.png'),
                            height: 80,
                            width: 40,
                          ),
                          Text(
                            'Supervisor(s)',
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
                    width: 160,
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
                          image:
                              AssetImage('images/ic_icon_calendar_event.png'),
                          height: 90,
                          width: 95,
                        ),
                        Text(
                          "Duties",
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Managers on duty',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
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
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
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
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
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
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
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
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
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
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
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
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
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
        ));
  }
}
