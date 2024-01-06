import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/res/colors.dart';
import 'package:skdoosh/utils/swipe_card/flutter_card_swiper.dart';
import 'package:skdoosh/view/home/Events.dart';
import 'package:skdoosh/view/home/Premium.dart';
import 'package:skdoosh/view/home/TabIconEvent.dart';
import 'package:skdoosh/view/home/TabIconEvent.dart';
import 'package:skdoosh/view/home/TabIconHome.dart';
import 'package:skdoosh/view/home/TabIconPremium.dart';
import 'package:skdoosh/view/home/TabIconWallet.dart';
import 'package:skdoosh/view/home/HomeScreen2.dart';
import 'package:skdoosh/view/home/WalletScreen.dart';
import 'package:skdoosh/view/home/notificationdrawer.dart';
import 'package:skdoosh/view/home/sidebar.dart';

import '../../res/routes/routes_name.dart';
import '../../utils/SharedPref.dart';
import '../../utils/swipe_card/card_swiper.dart';
import '../../utils/swipe_card/card_swiper_controller.dart';
import '../../utils/swipe_card/enums.dart';
import '../../utils/swipe_card/example_candidate_model.dart';
import '../../utils/swipe_card/example_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {


  _get()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action1 = prefs.getString('user_id');
    final String? action2 = prefs.getString('user_name');
    debugPrint('user-ud=${action1}');
    debugPrint('user-ud=${action2}');
  }


  int _selectedIndex = 0;
  String _selectedTabTitle = "";
  Color _selectedAppBarBg = AppColor.lighPrimaryBg;
  TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black);
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen2(),
    WalletScreen(),
    EventScreen(),
    PremiumScreen(),
    // Text(
    //   'Premium',
    //   style: TextStyle(color: Colors.black),
    // ),
  ];
  final CardSwiperController controller = CardSwiperController();
  final cards = candidates.map(ExampleCard.new).toList();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _get();
    _selectedAppBarBg = AppColor.lighPrimaryBg;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: AppBar(
            backgroundColor: _selectedAppBarBg,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Image.asset('images/Drawer.png'),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
            title: Center(
              child: Text(
                _selectedTabTitle,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            actions: [
              Builder(
                  builder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: primaryBg),
                          child: IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openEndDrawer();
                              },
                              icon: Image.asset('images/Notification.png')),
                        ),
                      )),
            ],
          ),
        ),
        key: _scaffoldKey,
        drawer: MyDrawer(),
        endDrawer: NotificationDrawer(),
        body: Stack(
          children: [
            Center(
                child: Container(
              child: _widgetOptions.elementAt(_selectedIndex),
            )),
            PositionedFab(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: primaryBg),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: GNav(
                    // backgroundColor: primaryBg,
                    color: Colors.white,
                    activeColor: Colors.black,
                    tabBackgroundColor: Colors.white,
                    tabBorderRadius: 30,
                    curve: Curves.easeOutExpo,
                    duration: Duration(milliseconds: 900),
                    haptic: true,
                    gap: 8,
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    tabs: [
                      GButton(icon: (TabIconHome.tab_home), text: 'Home'),
                      GButton(icon: (TabIconWallet.tab_wallet), text: "wallet"),
                      GButton(icon: (TabIconEvent.tab_event), text: "Events"),
                      GButton(icon: (TabIconPremium.tab_premium), text: "Premium"),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                        debugPrint('_selectedIndex=$_selectedIndex');
                        switch (index) {
                          case 0:
                            {
                              _selectedTabTitle = "Hii, User";
                              _selectedAppBarBg = AppColor.lighPrimaryBg;
                            }
                            break;
                          case 1:
                            {
                              _selectedAppBarBg = Colors.white;
                              _selectedTabTitle = "Revenue";
                            }
                            break;
                          case 2:
                            {
                              _selectedAppBarBg = Colors.white;
                              _selectedTabTitle = "Events";
                            }
                            break;
                          case 3:
                            {
                              _selectedAppBarBg = Colors.white;
                              _selectedTabTitle =
                                  "Enjoy the Exclusive Services with Premium";
                            }
                            break;
                        }
                        //NavigateScreen(_selectedIndex);
                      });
                    },
                  ),
                ),
              ],
            ),
            // ),
          ),
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

class PositionedFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double fabMargin = 0.0;
    return Positioned(
      bottom: 16.0,
      right: fabMargin,
      child: Container(
        width: 70,
        height: 60,
        decoration: BoxDecoration(
            color: AppColor.lighPrimaryBg1,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                topLeft: Radius.circular(35))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FloatingActionButton(
            backgroundColor: AppColor.primaryBg,
            onPressed: () {
              Get.toNamed(RouteName.createEvent);
            },
            child: Icon(Icons.add,size: 40,),
          ),
        ),
      ),
    );
  }
}