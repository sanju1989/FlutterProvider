import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
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
import 'package:skdoosh/view/home/notificationdrawer.dart';
import 'package:skdoosh/view/home/sidebar.dart';

import '../../utils/swipe_card/card_swiper.dart';
import '../../utils/swipe_card/card_swiper_controller.dart';
import '../../utils/swipe_card/enums.dart';
import '../../utils/swipe_card/example_candidate_model.dart';
import '../../utils/swipe_card/example_card.dart';

class Homescreen1 extends StatefulWidget {
  const Homescreen1({super.key});

  @override
  State<Homescreen1> createState() => _Homescreen1State();
}

class _Homescreen1State extends State<Homescreen1> {
  late int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  List<Widget> _widgetOptions = <Widget>[
    // debugPrint('inside _widgetoption');
    //   Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context)=> WalletScreen())
    //   );
    //WalletScreen(),
    //EventScreen(),
    //PremiumScreen()
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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: AppColor.lighPrimaryBg,
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
                "Hii, John",
                style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),
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
                  ))
            ],
          ),
        ),
        key: _scaffoldKey,
        drawer: MyDrawer(),
        endDrawer: NotificationDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              //_widgetOptions.elementAt(_selectedIndex),
              // debugPrint('jjkj$_selectedIndex');
              Container(
                height: 170,
                decoration: const BoxDecoration(
                  color: homecolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 90,
                      padding: const EdgeInsets.only(
                          top: 30, right: 20, left: 20, bottom: 10),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            child: const ImageIcon(
                                AssetImage("images/Drawer.png")),
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                "Hii, John",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: primaryBg),
                            child: GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState?.openEndDrawer();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ImageIcon(
                                  AssetImage("images/Notification.png"),
                                  size: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Revenue from the last event',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Rs. 1000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: CardSwiper(
                  allowedSwipeDirection: AllowedSwipeDirection.only(
                      up: false, down: false, left: true, right: true),
                  controller: controller,
                  cardsCount: cards.length,
                  onSwipe: _onSwipe,
                  onUndo: _onUndo,
                  numberOfCardsDisplayed: 3,
                  backCardOffset: const Offset(40, 40),
                  padding: const EdgeInsets.only(
                      left: 30.0, top: 70.0, bottom: 60.0, right: 30.0),
                  //padding: const EdgeInsets.only(left: 50.0,top: 50.0,bottom: 50.0,right: 50.0),
                  cardBuilder: (
                      context,
                      index,
                      horizontalThresholdPercentage,
                      verticalThresholdPercentage,
                      ) =>
                  cards[index],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: primaryBg),
            child: Row(
              children: <Widget>[
                GNav(
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
                    GButton(
                        icon: (TabIconPremium.tab_premium), text: "Premium"),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                      debugPrint('_selectedIndex=$_selectedIndex');
                      NavigateScreen(_selectedIndex);
                    });
                  },
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

  void NavigateScreen(int selectedIndex) {
    if (_selectedIndex == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen2()));
    } else if (_selectedIndex == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen2()));
    } else if (_selectedIndex == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const EventScreen()));
    } else if (_selectedIndex == 3) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PremiumScreen()));
    }
  }
}
