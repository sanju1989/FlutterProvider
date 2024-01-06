// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:skdoosh/colors.dart';
//
// class PremiumScreen extends StatefulWidget {
//   const PremiumScreen({super.key});
//
//   @override
//   State<PremiumScreen> createState() => _PremiumScreenState();
// }
//
// class _PremiumScreenState extends State<PremiumScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Colors.white,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:skdoosh/colors.dart';
import 'package:skdoosh/view/event/eventrequest.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../res/app_color.dart';
import '../../res/colors.dart';


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
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 40,
          decoration: BoxDecoration(
            // color: Colors.redAccent,
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Text("Free")),
                    Text("Ads",style: TextStyle(fontFamily: "FontInter",fontSize: 20)),
                  ],
                ),
                VerticalDivider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Premium"),
                    Text("Ad-Free",style: TextStyle(fontFamily: "FontInter",fontSize: 20),),
                  ],
                )
              ],
            ),
          ),


        ),
      ),
    );
  }
}

class PremiumScreen extends StatefulWidget {
  @override
  _PremiumScreen createState() => _PremiumScreen();
}

class _PremiumScreen extends State<PremiumScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBg,
      body: Column(

        children: <Widget>[
          // Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
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
          // Spacer(),
          Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
            decoration: BoxDecoration(
              // color: Colors.redAccent,
              borderRadius: BorderRadius.circular(16.0),
              color: AppColor.signinpage,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Current Plan"),
                      Column(
                        children: [
                          Text("Skdoosh",style: TextStyle(color: Colors.white,fontFamily: "Font Inter"),),
                          Text("free",style: TextStyle(color: Colors.white,fontFamily: "Font Inter"),),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(25),
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/rectangle_box.png',), // Replace 'your_image.png' with your image asset path
                        fit: BoxFit.cover, // Adjust the BoxFit as needed
                      ),
                    ),
                    child: Image.asset("images/go_premium.png",),
                  ),
                ),
                Text("Terms and Conditions apply",style: TextStyle(fontSize: 10,fontFamily: "FontInter"),)
              ],
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            margin: EdgeInsets.only(left: 50,right: 50,top: 20),
            decoration: BoxDecoration(
              // color: Colors.redAccent,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
              color:Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding:  EdgeInsets.all(10),
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.signincolor,
                    ),
                    child: Text("Free For 1 Month",style: TextStyle(color: Colors.white,fontFamily: "FontInter"),),
                  ),
                  
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Loreum Ipsum is dummy text",style: TextStyle(fontSize: 15),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: cars.map(
            (car) {
          var index = cars.indexOf(car);
          return Container(
            width: 7.0,
            height: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
              currentPage == index ? Colors.red : Color(0xFFA6AEBD),
            ),
          );
        },
      ).toList(),
    );
  }
}
