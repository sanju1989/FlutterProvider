import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/data/response/status.dart';
import 'package:skdoosh/model/ticket/ticketlist_response.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'package:skdoosh/view/event/newevent_publish.dart';
import 'package:skdoosh/view/event/neweventclub.dart';
import 'package:skdoosh/view/event/publishevent.dart';
import 'package:skdoosh/view/tickets/createticketscategories.dart';
import 'package:provider/provider.dart';
import 'package:skdoosh/view_models/ticket_viewmodel.dart';
import '../../colors.dart';
import '../../res/app_color.dart';
import '../home/notificationdrawer.dart';
import 'createticketscategories.dart';
import 'createticketscategories.dart';
import 'createticketscategories.dart';
import 'createticketscategories.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  TicketViewModel ticketViewModel=TicketViewModel();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Method> items = [];

  @override
  void initState() {
    super.initState();
    ticketViewModel.fetchSavedTicketList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              Get.back();
          }, icon: Icon(Icons.arrow_back_ios,
                color: Colors.black,
                size: 30.0),
            ),
            ),
            title: Center(
              child: Text("Tickets",
              style: TextStyle(
                fontSize: 25,
                         color: Colors.black,
                         fontWeight: FontWeight.w400),),
            ),
            actions: [
              Builder(builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.primaryBg
                  ),
                  child: IconButton(onPressed: (){
                    _scaffoldKey.currentState!.openEndDrawer();
                  }, icon: Image.asset('images/Notification.png'),),
                ),
              ) )
            ],

          )),
      key: _scaffoldKey,
      endDrawer: NotificationDrawer(),

    body:Center(

      child: ChangeNotifierProvider<TicketViewModel>(
        create: (BuildContext context)=> ticketViewModel,
        child: Consumer<TicketViewModel>(
          builder: (context, value, _) {
            switch (value.ticketList.status){
              case Status.LOADING:
                return SizedBox(
                  height: 50,
                  child: const Center(child: CircularProgressIndicator()),
                );
              case Status.ERROR:
                debugPrint(value.ticketList.message);
                return Text('data');
              case Status.COMPLETED:
                debugPrint(value.ticketList.data?.data?.length.toString());

               return Column(
                  children: [
                    Expanded(
                        child:ListView.builder(
                            itemCount:value.ticketList.data?.data?.length,
                            itemBuilder: ((context,index){
                              return Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 150,
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Image.asset("images/individual_color.png"),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          margin: const EdgeInsets.only(top: 20),
                                          child: Image.asset("images/ticket_right.png", fit: BoxFit.cover),
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(top: 40,left: 15),
                                                    child:
                                                    Text("${value.ticketList.data?.data?[index].ticketName}",style: TextStyle(fontSize: 15),)
                                                  //  ),
                                                ),
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.all(8.0),
                                                      margin: EdgeInsets.only(left: 10),
                                                      child:Image.asset("images/money.png"),
                                                      // Text("5000"),
                                                    ),
                                                    Container(
                                                      child: Text("${value.ticketList.data?.data?[index].price}"),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(top: 20,left: 15),
                                                    child:Text("${value.ticketList.data?.data?[index].description}")
                                                ),
                                              ],),
                                            Column(
                                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(left: 30),
                                                        child:Text("x",)
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(left: 10),
                                                        child:Text("${value.ticketList.data?.data?[index].cover}",style: TextStyle(fontSize: 25),)
                                                    ),
                                                  ],),

                                                Row(
                                                  children: [
                                                    Container(
                                                      //  margin: EdgeInsets.only(left: 30),
                                                      child:Icon(Icons.accessibility),
                                                    ),
                                                    Container(
                                                      //  margin: EdgeInsets.only(left: 30),
                                                        child:Text("x",)
                                                    ),
                                                    Container(
                                                      //  margin: EdgeInsets.only(left: 10),
                                                        child:Text("1",style: TextStyle(fontSize: 25),)
                                                    ),
                                                  ],),
                                              ],),
                                          ],),
                                      ],
                                    )
                                  ],
                                )
                              ],
                              );
                            }))
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateTicket()),
                                );
                                // Handle button 1 press
                              },
                              style: ElevatedButton.styleFrom(
                                primary: homecolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              child: Text(
                                'New Ticket',
                                style: TextStyle(fontSize: 12, fontFamily: 'FontIner', color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewEventPublish()),
                                );
                              },
                              child: Text(
                                'Preview',
                                style: TextStyle(fontFamily: 'FontIner',fontSize: 12,color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ],
            );
              default:
                return Text('data');
            }
          },
        ),
      ),

    )
      /*body:
      items.isNotEmpty
          ? Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: ((context, index) {
                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          margin: const EdgeInsets.only(top: 20),
                          child: Image.asset("images/individual_color.png"),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 150,
                              margin: const EdgeInsets.only(top: 20),
                              child: Image.asset("images/ticket_right.png", fit: BoxFit.cover),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 40,left: 15),
                                        child:
                                        Text("Male Stag",style: TextStyle(fontSize: 15),)
                                      //  ),
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          margin: EdgeInsets.only(left: 10),
                                          child:Image.asset("images/money.png"),
                                          // Text("5000"),
                                        ),
                                        Container(
                                          child: Text("5000"),
                                        )
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 20,left: 15),
                                        child:Text("Entery of 1 maile stag is\npermitted on this ticket with full\ncover")
                                    ),
                                  ],),
                                Column(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(left: 30),
                                            child:Text("x",)
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child:Text("50",style: TextStyle(fontSize: 25),)
                                        ),
                                      ],),

                                    Row(
                                      children: [
                                        Container(
                                          //  margin: EdgeInsets.only(left: 30),
                                          child:Icon(Icons.accessibility),
                                        ),
                                        Container(
                                          //  margin: EdgeInsets.only(left: 30),
                                            child:Text("x",)
                                        ),
                                        Container(
                                          //  margin: EdgeInsets.only(left: 10),
                                            child:Text("1",style: TextStyle(fontSize: 25),)
                                        ),
                                      ],),
                                  ],),
                              ],),
                          ],
                        )

                      ],
                    )
                  ],
                  );
                })
            )
        ),
        Container(
          padding: EdgeInsets.only(top: 30,bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 50,
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateTicket()),
                    );
                    // Handle button 1 press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: homecolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Text(
                    'New Ticket',
                    style: TextStyle(fontSize: 12, fontFamily: 'FontIner', color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewEventClub()),
                    );
                  },
                  child: Text(
                    'Preview',
                    style: TextStyle(fontFamily: 'FontIner',fontSize: 12,color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
            ],
          ),
        )
      ]):*/
  /*    Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, ),
                child: // Inside the GestureDetector where you navigate to CreateTicket
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.of(context).push<Method>(
                      MaterialPageRoute(builder: (_) => CreateTicket()),
                    );

                    // Check if result is not null and update items list
                    if (result != null) {
                      setState(() {
                        if (result.title.isNotEmpty &&
                            result.desc.isNotEmpty &&
                            result.tickets.isNotEmpty &&
                            result.cover.isNotEmpty &&
                            result.price.isNotEmpty) {
                          items.add(Method(
                            title: result.title,
                            desc: result.desc,
                            tickets: result.tickets,
                            cover: result.cover,
                            price: result.price,
                          ));
                        }
                      });
                    }
                  },
                  child: Image.asset("images/ticket_black.png"),
                ),
            ),
          ),

           Text("No tickets categories\n created",
                style: TextStyle(color: AppColor.textcolor, fontFamily: "FontInter",fontSize: 25),
           ),*/


          


    );
  }
}
