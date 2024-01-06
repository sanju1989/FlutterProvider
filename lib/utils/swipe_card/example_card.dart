import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/res/colors.dart';
import 'package:skdoosh/res/routes/routes_name.dart';

import 'example_candidate_model.dart';

class ExampleCard extends StatefulWidget {
  final ExampleCandidateModel candidate;

  const ExampleCard(
    this.candidate, {
    Key? key,
  }) : super(key: key);

  @override
  State<ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends State<ExampleCard> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    //int currentPage = 0;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(35)),
        color: widget.candidate.color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteName.publishevent);
            },
            child: Container(
              color: widget.candidate.color,
              child: Flexible(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 12.0),
                        child: Text(
                          'Venue Name',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Upcoming events'),
                    ),
                    Column(
                     // alignment: Alignment.center,
                      children: [
                        /*    Container(
                          height: 230,
                          width: 190,
                          //color: candidate.color,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/ic_party_bg.png'))
                              ),
                        ),*/

                        // Container(
                        //   height: 155,
                        //   width: 160,
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.white)),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       const Padding(
                        //         padding: EdgeInsets.all(18.0),
                        //         child: Text(
                        //           'Pulse Party',
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 18.0),
                        //         ),
                        //       ),
                        //       Container(
                        //         height: 1.0,
                        //         width: 160,
                        //         color: Colors.white,
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           const Column(
                        //             children: [
                        //               Text(
                        //                 'data',
                        //                 style: TextStyle(
                        //                     color: Colors.white, fontSize: 9.0),
                        //               ),
                        //               Text(
                        //                 '01 sep 2023',
                        //                 style: TextStyle(
                        //                     color: Colors.white, fontSize: 11.0),
                        //               ),
                        //             ],
                        //           ),
                        //           Container(
                        //             height: 30.0,
                        //             width: 1.0,
                        //             color: Colors.white,
                        //           ),
                        //           const Column(
                        //             children: [
                        //               Text(
                        //                 'time',
                        //                 style: TextStyle(
                        //                     color: Colors.white, fontSize: 9.0),
                        //               ),
                        //               Text(
                        //                 '21:00 Hrs',
                        //                 style: TextStyle(
                        //                     color: Colors.white, fontSize: 11.0),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //       Container(
                        //         height: 1.0,
                        //         width: 160.0,
                        //         color: Colors.white,
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           const Column(
                        //             children: [
                        //               Text(
                        //                 'location',
                        //                 style: TextStyle(
                        //                     color: Colors.white, fontSize: 9.0),
                        //               ),
                        //               Text(
                        //                 'electr...',
                        //                 style: TextStyle(
                        //                     color: Colors.white, fontSize: 11.0),
                        //               ),
                        //             ],
                        //           ),
                        //           Container(
                        //             height: 30.0,
                        //             width: 1.0,
                        //             color: Colors.white,
                        //           ),
                        //           const Column(
                        //             children: [
                        //               Text(
                        //                 'charges',
                        //                 style: TextStyle(
                        //                     color: Colors.white, fontSize: 9.0),
                        //               ),
                        //               Text(
                        //                 '2000',
                        //                 style: TextStyle(
                        //                     color: Colors.white, fontSize: 11.0),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          //height: MediaQuery.of(context).size.height * 0.2,
                          height: 230,

                          child: PageView.builder(

                            itemBuilder: (context, index) {
                              return Opacity(
                                //opacity: currentPage == index ? 1.0 : 0.8,
                                opacity: 1.0,
                                child: CarouselCard(
                                  evntObj: eventList[index],
                                ),
                              );
                            },
                            itemCount: eventList.length,
                            controller: PageController(
                                initialPage: 0, viewportFraction: 0.75),
                            onPageChanged: (index) {
                              debugPrint("inside onpage change");
                              setState(() {
                                debugPrint("inside set state$index");
                                currentPage = index;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        updateIndicators(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         candidate.name,
          //         style: const TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20,
          //         ),
          //       ),
          //       const SizedBox(height: 5),
          //       Text(
          //         candidate.job,
          //         style: const TextStyle(
          //           color: Colors.grey,
          //           fontSize: 15,
          //         ),
          //       ),
          //       const SizedBox(height: 5),
          //       Text(
          //         candidate.city,
          //         style: const TextStyle(color: Colors.grey),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: eventList.map(
        (car) {
          var index = eventList.indexOf(car);
          return Container(
            width: 7.0,
            height: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index ? Colors.red : Color(0xFFA6AEBD),
            ),
          );
        },
      ).toList(),
    );
  }
}

// ignore: must_be_immutable
class CarouselCard extends StatelessWidget {
  CarouselCard({required this.evntObj});

  EventsforVenu evntObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Container(
          //height: 230,
          //width: 190,
          // height: 155,
          // width: 160,
          //color: candidate.color,
          decoration:  const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'images/ic_party_bg.png')
              ),
          ),
          child: Container(
            margin: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    evntObj.name.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                Container(
                  height: 1.0,
                  width: 160,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Column(
                      children: [
                        const Text(
                          'date',
                          style: TextStyle(color: Colors.white, fontSize: 9.0,fontFamily: 'FontInter'),
                        ),
                        Text(
                          evntObj.date.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 11.0,fontFamily: 'FontInter'),
                        ),
                      ],
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.white,
                    ),
                     Column(
                      children: [
                        const Text(
                          'Time',
                          style: TextStyle(color: Colors.white, fontSize: 9.0,fontFamily: 'FontInter'),
                        ),
                        Text(
                          evntObj.time.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 11.0,fontFamily: 'FontInter'),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 1.0,
                  width: 160.0,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Column(
                      children: [
                        const Text(
                          'Location',
                          style: TextStyle(color: Colors.white, fontSize: 9.0,fontFamily: 'FontInter'),
                        ),
                        Text(
                          evntObj.location.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 11.0,fontFamily: 'FontInter'),
                        ),
                      ],
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.white,
                    ),
                     Column(
                      children: [
                        const Text(
                          'Charges',
                          style: TextStyle(color: Colors.white, fontSize: 9.0,fontFamily: 'FontInter'),
                        ),
                        Text(
                          evntObj.charges.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 11.0,fontFamily: 'FontInter'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}