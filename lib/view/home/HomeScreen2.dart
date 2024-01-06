import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/utils/swipe_card/card_swiper.dart';
import 'package:skdoosh/view_models/homemodel/home_view_model.dart';

import '../../res/routes/routes_name.dart';
import '../../utils/swipe_card/allowed_swipe_direction.dart';
import '../../utils/swipe_card/card_swiper_controller.dart';
import '../../utils/swipe_card/enums.dart';
import '../../utils/swipe_card/example_candidate_model.dart';
import '../../utils/swipe_card/example_card.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  HomeViewModel  homeViewModel = HomeViewModel();
  final CardSwiperController controller = CardSwiperController();

  final cards = candidates.map(ExampleCard.new).toList();
  String user_id='';
  _getUserInfo()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action1 = prefs.getString('user_id');
    final String? action2 = prefs.getString('user_name');
    debugPrint('user-ud=${action1}');
    debugPrint('user-ud=${action2}');
    setState(() {
      user_id=action2.toString();
    });
  }
  @override
  void initState() {
    _getUserInfo();
    Map data ={
      'user_id':user_id,
    };
    homeViewModel.homeApi(data, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            color: AppColor.lighPrimaryBg,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
          ),
          child: Column(
            children: [
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
                    "\$1000",
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
        Expanded(
            child: CardSwiper(
              allowedSwipeDirection: AllowedSwipeDirection.only(
                  up: false, down: true, left: false, right: false),
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
