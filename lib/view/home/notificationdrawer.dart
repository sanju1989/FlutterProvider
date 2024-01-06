import 'package:flutter/material.dart';

import '../../colors.dart';

class NotificationDrawer extends StatefulWidget {
  const NotificationDrawer({super.key});

  @override
  State<NotificationDrawer> createState() => _NotificationDrawerState();
}

class _NotificationDrawerState extends State<NotificationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 280, top: 40, left: 120),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          topLeft: Radius.circular(80),
        ),
        child: SizedBox(
          // width: 250,
          child: Drawer(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: drawercolor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios,
                                color: Colors.white, size: 20.0)),
                      ),
                      // SizedBox(width: 50,),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    // padding: EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Today",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Lorem Ipsum Is Simply Dummy Text of The Printing And Typesetting Industry.",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: Colors.white,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    // padding: EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Yesterday",
                      style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Lorem Ipsum Is Simply Dummy Text of The Printing And Typesetting Industry.",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    // padding: EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Last Seven Days",
                      style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Lorem Ipsum Is Simply Dummy Text of The Printing And Typesetting Industry.",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: Colors.white,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),

              //     // new ListTile(
              //     //   title: new Text(
              //     //     'Profile',
              //     //     style: TextStyle(
              //     //       fontSize: 16.0,
              //     //
              //     //       color: Colors.white,
              //     //     ),
              //     //   ),
              //     //   onTap: () {
              //     //     // Update the state of the app
              //     //     // ...
              //     //     // Then close the drawer
              //     //     Navigator.pop(context);
              //     //   },
              //     //   leading: new ImageIcon(AssetImage("images/profile.png"),
              //     //     color: Colors.white,
              //     //
              //     //   ),
              //     // ),
              //     // new ListTile(
              //     //   title: new Text(
              //     //     'Staff',
              //     //     style: TextStyle(
              //     //       fontSize: 16.0,
              //     //       // fontWeight: FontWeight.w600,
              //     //       color: Colors.white,
              //     //     ),
              //     //   ),
              //     //   onTap: () {
              //     //     // Update the state of the app
              //     //     // ...
              //     //     // Then close the drawer
              //     //     Navigator.pop(context);
              //     //   },
              //     //   leading: new ImageIcon(AssetImage("images/staff.png"),
              //     //     color: Colors.white,
              //     //
              //     //   ),
              //     // ),
              //     // new ListTile(
              //     //   title: new Text(
              //     //     'Calendar',
              //     //     style: TextStyle(
              //     //       fontSize: 16.0,
              //     //       // fontWeight: FontWeight.w600,
              //     //       color: Colors.white,
              //     //     ),
              //     //   ),
              //     //   onTap: () {
              //     //     // Update the state of the app
              //     //     // ...
              //     //     // Then close the drawer
              //     //     Navigator.pop(context);
              //     //   },
              //     //   leading: new ImageIcon(AssetImage("images/calendar.png"),
              //     //     color: Colors.white,
              //     //
              //     //   ),
              //     // ),
              //     // new ListTile(
              //     //   title: new Text(
              //     //     'Analytics',
              //     //     style: TextStyle(
              //     //       fontSize: 16.0,
              //     //       fontWeight: FontWeight.w600,
              //     //       color: Colors.white,
              //     //     ),
              //     //   ),
              //     //   onTap: () {
              //     //     // Update the state of the app
              //     //     // ...
              //     //     // Then close the drawer
              //     //     Navigator.pop(context);
              //     //   },
              //     //   leading: new ImageIcon(AssetImage("images/analytics.png"),
              //     //     color: Colors.white,
              //     //
              //     //   ),
              //     // ),
              //     // // new Divider(
              //     // //   color: Colors.black38,
              //     // // ),
              //     // new ListTile(
              //     //   title: new Text(
              //     //     'Settings',
              //     //     style: TextStyle(
              //     //       fontSize: 16.0,
              //     //       // fontWeight: FontWeight.w600,
              //     //       color: Colors.white,
              //     //     ),
              //     //   ),
              //     //   onTap: () {
              //     //
              //     //     Navigator.pop(context);
              //     //   },
              //     //   leading: new ImageIcon(AssetImage("images/Settings_logo.png"),
              //     //     color: Colors.white,
              //     //
              //     //   ),
              //     // ),
              //   ],
            ),
          ),
        ),
      ),
    );
  }
}
