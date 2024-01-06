import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skdoosh/res/component/RoundButton.dart';
import 'package:skdoosh/utils/Utils.dart';
import 'package:skdoosh/view_models/ticket_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../colors.dart';
import '../../data/response/status.dart';
import '../../res/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../home/notificationdrawer.dart';

class CreateTicket extends StatefulWidget {
  const CreateTicket({super.key});

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class Method {
  late String title;
  late String desc;
  late String price;
  late String tickets;
  late String cover;

  // late String quantity;

  Method({
    required this.title,
    required this.desc,
    required this.price,
    required this.tickets,
    required this.cover,
    // required this.quantity
  });
}

class _CreateTicketState extends State<CreateTicket> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TicketViewModel ticketViewModel = TicketViewModel();
  var categorytype;
  var userId;
  // bool ischecked1 = false;
  // bool ischecked2 = false;
  // bool ischecked3 = false;
  // bool ischecked4 = false;
  // bool ischecked5 = false;
  late int selectedRadio;


  _getSharedpref()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action1 = prefs.getString('user_id');
    final String? action2 = prefs.getString('user_name');
    debugPrint('user-ud=${action1}');
    debugPrint('user-ud=${action2}');
    setState(() {
      userId=action1.toString();
    });
  }
  @override
  void initState() {
    super.initState();
    _getSharedpref();
    selectedRadio = 0;
    ticketViewModel.fetchTicketCategory();
  }

  int malequantity = 0;
  int femalequantity = 0;
  int couplequantity = 0;
  int neutralquantity = 0;

  int totalQuantity() {
    return malequantity + femalequantity + couplequantity + neutralquantity;
  }

  String displayText = 'Number of people allowed on 1 qt.';

  void updateDisplayText() {
    setState(() {
      displayText = 'Total quantity: ${totalQuantity()}';
      quantityCtr=totalQuantity().toString();
    });
  }
  String  quantityCtr='';

  TextEditingController titleCtr = TextEditingController();
  TextEditingController descCtr = TextEditingController();
  TextEditingController priceCtr = TextEditingController();
  TextEditingController ticketsCtr = TextEditingController();
  TextEditingController coverCtr = TextEditingController();
  //TextEditingController quantityCtr = TextEditingController();

  OnPressed(BuildContext context) {
    var data = Method(
      title: titleCtr.text,
      desc: descCtr.text,
      price: priceCtr.text,
      tickets: ticketsCtr.text,
      cover: coverCtr.text,
      //   quantity: quantityCtr.text,
    );
    Navigator.pop(context, data);
  }
  getColorCode(int value){
    if(value==1){
      return '#B0B0F6';
    }
    else if(value==2){
      return '#6ADB98';
    }
    else if(value==3){
      return '#FD9898';
    }
    else if(value==4){
      return '#6FDCFF';
    }
    else if(value==5){
      return '#C79BFF';
    }
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
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              title: const Center(
                  child: Text("Create Ticket\n Categories",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w400))),
              actions: [
                Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.primaryBg),
                      child: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                        icon: Image.asset('images/Notification.png'),
                      ),
                    ),
                  ),
                )
              ],
            )),
        key: _scaffoldKey,
        endDrawer: const NotificationDrawer(),
        body: Form(child: Builder(builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primaryBg),
                        color: AppColor.colorwhite,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: double.infinity,
                      height: 50,
                      child: ChangeNotifierProvider<TicketViewModel>(
                          create: (BuildContext context) => ticketViewModel,
                          child: Consumer<TicketViewModel>(
                              builder: (context, value, _) {
                            switch (value.ticketCtgryList.status) {
                              case Status.LOADING:
                                return SizedBox(
                                  height: 50,
                                  child: const Center(
                                      child: CircularProgressIndicator()),
                                );
                              case Status.ERROR:
                                return Text(
                                    value.ticketCtgryList.message.toString());
                              case Status.COMPLETED:
                                debugPrint(value
                                    .ticketCtgryList.data!.data!.length
                                    .toString());
                                List<DropdownMenuItem<String>> s =
                                    List.generate(
                                  value.ticketCtgryList.data!.data!.length,
                                  (index) => DropdownMenuItem(
                                    value: value.ticketCtgryList.data!
                                        .data![index].ticketCategoryId
                                        .toString(),
                                    child: Text(
                                        "${value.ticketCtgryList.data!.data![index].categoryName}"),
                                  ),
                                );

                                // _popularMovieList(value);
                                return DropdownButton(
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  items: s,
                                  hint: Text('Category'),
                                  value: categorytype,
                                  onChanged: (value) {
                                    setState(() {
                                      categorytype = value.toString();
                                      debugPrint("ctgryid$categorytype");
                                    });
                                  },
                                );
                              default:
                                return const Text("TTTT");
                            }
                          }))),
                  // DropdownButtonFormField<String>(
                  //   decoration: const InputDecoration(
                  //     border: InputBorder.none,
                  //     hintText: 'Category',
                  //   ),
                  //   icon: const Icon(Icons.keyboard_arrow_down),
                  //   items: <String>['Category A', 'Category B', 'Category C', 'Category D']
                  //       .map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue) {
                  //     // Handle dropdown value changes here
                  //   },
                  //   // Set an initial value if needed
                  //   // value: initialValue,
                  // ),

                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryBg),
                      color: AppColor.colorwhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'FontInter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      controller: titleCtr,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Category Name',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 30, left: 30),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primaryBg),
                          color: AppColor.colorwhite,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 150,
                        height: 50,
                        child: TextField(
                          controller: priceCtr,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Price ',
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, right: 30),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primaryBg),
                          color: AppColor.colorwhite,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 150,
                        height: 50,
                        child: TextField(
                          controller: ticketsCtr,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'No. of Tickets',
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryBg),
                      color: AppColor.colorwhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'FontInter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      controller: coverCtr,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Cover',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryBg),
                      color: AppColor.colorwhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        showSheet(context);
                      },
                      // onTap: () {
                      //   int quantity = 0;
                      //   showModalBottomSheet(
                      //     context: context,
                      //     builder: (BuildContext builder) {
                      //       return Container(
                      //         height: 300,
                      //         color: Colors.white,
                      //         child: Column(
                      //           children: [
                      //             Container(margin: EdgeInsets.only(top: 25),
                      //               child: Align(alignment: Alignment.topCenter,
                      //                   child: Text("Quantity",
                      //                     style: TextStyle(fontSize: 20, fontFamily: "FontInter"),),
                      //               ),
                      //             ),
                      //             Divider(),
                      //             Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //
                      //               children: <Widget>[
                      //                 Text("Male"),
                      //                 Row(
                      //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                   children: [
                      //                     IconButton(onPressed: (){
                      //                       setState(() {
                      //                         if(quantity > 0){
                      //                           quantity--;
                      //                         }
                      //                       });
                      //                     },icon: Icon(Icons.remove)),
                      //                     Container(
                      //                       child: Text(quantity.toString(),textAlign: TextAlign.center,),
                      //                     ),
                      //
                      //                     IconButton(onPressed: (){
                      //                       setState(() {
                      //                         quantity++;
                      //                       });
                      //                     },icon: Icon(Icons.add)),
                      //                   ],
                      //                 ),
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //
                      //
                      //       );
                      //     },
                      //   );
                      // },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          displayText,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'FontInter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryBg),
                      color: AppColor.colorwhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    height: 120,
                    child: TextField(
                      controller: descCtr,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ticket Description',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRadio = 1;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedRadio == 1
                                  ? AppColor.colorlightpurple
                                  : AppColor.colorlightpurple,
                              border: selectedRadio == 1
                                  ? Border.all(color: AppColor.colorlightpurple)
                                  : null,
                            ),
                            child: selectedRadio == 1
                                ? Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRadio = 2;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedRadio == 2
                                  ? AppColor.colorgreen
                                  : AppColor.colorgreen,
                              border: selectedRadio == 2
                                  ? Border.all(color: AppColor.colorgreen)
                                  : null,
                            ),
                            child: selectedRadio == 2
                                ? Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRadio = 3;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedRadio == 3
                                  ? AppColor.colororange
                                  : AppColor.colororange,
                              border: selectedRadio == 3
                                  ? Border.all(color: AppColor.colororange)
                                  : null,
                            ),
                            child: selectedRadio == 3
                                ? Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRadio = 4;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedRadio == 4
                                  ? AppColor.colorsky
                                  : AppColor.colorsky,
                              border: selectedRadio == 4
                                  ? Border.all(color: AppColor.colorsky)
                                  : null,
                            ),
                            child: selectedRadio == 4
                                ? Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRadio = 5;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedRadio == 5
                                  ? AppColor.colordarkpurple
                                  : AppColor.colordarkpurple,
                              border: selectedRadio == 5
                                  ? Border.all(color: AppColor.colordarkpurple)
                                  : null,
                            ),
                            child: selectedRadio == 5
                                ? Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       GestureDetector(
                  //         onTap: (){
                  //           setState(() {
                  //             ischecked1 = !ischecked1;
                  //           });
                  //         },
                  //         child: Container(
                  //           width: 20,
                  //           height: 20,
                  //           decoration: const BoxDecoration(shape: BoxShape.circle,
                  //               color:  AppColor.colorlightpurple),
                  //           child: ischecked1
                  //           ? const Icon(
                  //             Icons.check,
                  //             size: 20,
                  //             color: Colors.white,
                  //           ) : null,
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: (){
                  //           setState(() {
                  //             ischecked2 = !ischecked2;
                  //           });
                  //         },
                  //         child: Container(
                  //           width: 20,
                  //           height: 20,
                  //           decoration: const BoxDecoration(shape: BoxShape.circle,color:AppColor.colorgreen),
                  //           child: ischecked2
                  //           ? const Icon(Icons.check,size: 20,
                  //               color: Colors.white,) : null
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: (){
                  //           setState(() {
                  //             ischecked3 = !ischecked3;
                  //           });
                  //         },
                  //         child: Container(
                  //           width: 20,
                  //           height: 20,
                  //           decoration: const BoxDecoration(shape: BoxShape.circle,color: AppColor.colororange),
                  //             child: ischecked3
                  //                 ? const Icon(Icons.check,size: 20,
                  //               color: Colors.white,) : null
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: (){
                  //           setState(() {
                  //             ischecked4 = !ischecked4;
                  //           });
                  //         },
                  //         child: Container(
                  //           width: 20,
                  //           height: 20,
                  //           decoration: const BoxDecoration(shape: BoxShape.circle,color: AppColor.colorsky),
                  //             child: ischecked4
                  //                 ? const Icon(Icons.check,size: 20,
                  //               color: Colors.white,) : null
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: (){
                  //           setState(() {
                  //             ischecked5 = !ischecked5;
                  //           });
                  //         },
                  //         child: Container(
                  //           width: 20,
                  //           height: 20,
                  //           decoration: const BoxDecoration(shape: BoxShape.circle,color: AppColor.colordarkpurple),
                  //             child: ischecked5
                  //                 ? const Icon(Icons.check,size: 20,
                  //               color: Colors.white,) : null
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, right: 30, left: 30),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    height: 65,
                    width: 200,
                    child: RoundButton(
                      radius: 30,
                      title: 'Create',
                      loading: ticketViewModel.loading,
                      onPress: () {
                        if (titleCtr.text.isEmpty) {
                          Utility.snackBar('Title required', context);
                        } else if (priceCtr.text.isEmpty) {
                          Utility.snackBar('Ticket Price required', context);
                        } else if (ticketsCtr.text.isEmpty) {
                          Utility.snackBar(
                              'Number of ticket required', context);
                        } else if (coverCtr.text.isEmpty) {
                          Utility.snackBar('cover Price required', context);
                        } else if (quantityCtr.isEmpty) {
                          Utility.snackBar(
                              'Number of people required', context);
                        } else if (descCtr.text.isEmpty) {
                          Utility.snackBar(
                              'Ticket Description required', context);
                        } else {
                          Map data = {
                            "ticket_category_id": categorytype,
                            "ticket_name": titleCtr.text.toString(),
                            "price": priceCtr.text.toString(),
                            "no_of_tickets": ticketsCtr.text.toString(),
                            "cover": coverCtr.text.toString(),
                            "number_of_people": quantityCtr,
                            "describe": descCtr.text.toString(),
                            "color_code": getColorCode(selectedRadio),
                            "user_id": '1'
                          };
                          ticketViewModel.addTicket(data, context);
                        }
                      },
                    ),
                    /* child: ElevatedButton(onPressed: ()
                    {
                      if (Form.of(context)?.validate() ?? false) {
                        OnPressed(context);
                      }
                    }, child: const Text("Create",style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          )
                      ),)*/
                  ),
                ],
              ),
            ),
          );
        }))
        // Center(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         SizedBox(height: 20,),
        //         Container(
        //           margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        //           padding: EdgeInsets.symmetric(horizontal: 20),
        //           decoration: BoxDecoration(
        //             color: AppColor.lighPrimaryBg,
        //             borderRadius: BorderRadius.circular(25),
        //           ),
        //           width: double.infinity,
        //           height: 50,
        //           child: DropdownButtonFormField<String>(
        //             decoration: InputDecoration(
        //               border: InputBorder.none,
        //               hintText: 'Category',
        //             ),
        //             icon: Icon(Icons.keyboard_arrow_down),
        //             items: <String>['Category A', 'Category B', 'Category C', 'Category D']
        //                 .map<DropdownMenuItem<String>>((String value) {
        //               return DropdownMenuItem<String>(
        //                 value: value,
        //                 child: Text(value),
        //               );
        //             }).toList(),
        //             onChanged: (String? newValue) {
        //               // Handle dropdown value changes here
        //             },
        //             // Set an initial value if needed
        //             // value: initialValue,
        //           ),
        //         ),
        //
        //
        //         Container(
        //           margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        //           padding: EdgeInsets.symmetric(horizontal: 20),
        //           decoration: BoxDecoration(
        //             color: AppColor.lighPrimaryBg,
        //             borderRadius: BorderRadius.circular(25),
        //           ),
        //           width: double.infinity,
        //           height: 50,
        //           child: TextField(
        //             style: TextStyle(
        //                 color: Colors.black,
        //                 fontFamily: 'FontInter',
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.w500),
        //             controller: titleCtr,
        //             decoration: InputDecoration(
        //               border: InputBorder.none,
        //               hintText: 'Category Name',
        //
        //             ),
        //             keyboardType: TextInputType.text,
        //           ),
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: <Widget>[
        //             Container(
        //               margin: EdgeInsets.only(top: 30,left: 30),
        //               padding: EdgeInsets.symmetric(horizontal: 20),
        //               decoration: BoxDecoration(
        //                 color: homecolor,
        //                 borderRadius: BorderRadius.circular(25),
        //
        //               ),
        //               width: 150,
        //               height: 50,
        //               child: TextField(
        //
        //                 decoration: InputDecoration(
        //                   border: InputBorder.none,
        //                   hintText: 'Price ',
        //                 ),
        //                 keyboardType: TextInputType.text,
        //               ),
        //             ),
        //             Container(
        //               margin: EdgeInsets.only(top: 30,right: 30),
        //               padding: EdgeInsets.symmetric(horizontal: 20),
        //               decoration: BoxDecoration(
        //                 color: homecolor,
        //                 borderRadius: BorderRadius.circular(25),
        //
        //               ),
        //               width: 150,
        //               height: 50,
        //               child: TextField(
        //
        //                 decoration: InputDecoration(
        //                   border: InputBorder.none,
        //                   hintText: 'No. of Tickets',
        //                 ),
        //                 keyboardType: TextInputType.text,
        //               ),
        //             ),
        //           ],
        //         ),
        //
        //       Container(
        //         margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        //         padding: EdgeInsets.symmetric(horizontal: 20),
        //         decoration: BoxDecoration(
        //           color: AppColor.lighPrimaryBg,
        //           borderRadius: BorderRadius.circular(25),
        //         ),
        //         width: double.infinity,
        //         height: 50,
        //         child: GestureDetector(
        //           onTap: (){
        //             showSheet(context);
        //           },
        //           // onTap: () {
        //           //   int quantity = 0;
        //           //   showModalBottomSheet(
        //           //     context: context,
        //           //     builder: (BuildContext builder) {
        //           //       return Container(
        //           //         height: 300,
        //           //         color: Colors.white,
        //           //         child: Column(
        //           //           children: [
        //           //             Container(margin: EdgeInsets.only(top: 25),
        //           //               child: Align(alignment: Alignment.topCenter,
        //           //                   child: Text("Quantity",
        //           //                     style: TextStyle(fontSize: 20, fontFamily: "FontInter"),),
        //           //               ),
        //           //             ),
        //           //             Divider(),
        //           //             Row(
        //           //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           //
        //           //               children: <Widget>[
        //           //                 Text("Male"),
        //           //                 Row(
        //           //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           //                   children: [
        //           //                     IconButton(onPressed: (){
        //           //                       setState(() {
        //           //                         if(quantity > 0){
        //           //                           quantity--;
        //           //                         }
        //           //                       });
        //           //                     },icon: Icon(Icons.remove)),
        //           //                     Container(
        //           //                       child: Text(quantity.toString(),textAlign: TextAlign.center,),
        //           //                     ),
        //           //
        //           //                     IconButton(onPressed: (){
        //           //                       setState(() {
        //           //                         quantity++;
        //           //                       });
        //           //                     },icon: Icon(Icons.add)),
        //           //                   ],
        //           //                 ),
        //           //               ],
        //           //             )
        //           //           ],
        //           //         ),
        //           //
        //           //
        //           //       );
        //           //     },
        //           //   );
        //           // },
        //              child: Align(alignment: Alignment.centerLeft,
        //                child: Text(
        //                   displayText,
        //                   style: TextStyle(
        //                     color: Colors.black,
        //                     fontFamily: 'FontInter',
        //                     fontSize: 14,
        //                     fontWeight: FontWeight.w500,
        //                   ),
        //                 ),
        //              ),
        //         ),
        //       ),
        //
        //
        //       Container(
        //           margin: EdgeInsets.only(top: 30,left: 30,right: 30),
        //           padding: EdgeInsets.symmetric(horizontal: 30),
        //           decoration: BoxDecoration(
        //             color: homecolor,
        //             borderRadius: BorderRadius.circular(40),
        //
        //           ),
        //           width: double.infinity,
        //           height: 120,
        //           child: TextField(
        //             controller: descCtr,
        //             decoration: InputDecoration(
        //               border: InputBorder.none,
        //               hintText: 'Ticket Description',
        //             ),
        //             keyboardType: TextInputType.text,
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(20),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: <Widget>[
        //               GestureDetector(
        //                 onTap: (){
        //                   setState(() {
        //                     ischecked1 = !ischecked1;
        //                   });
        //                 },
        //                 child: Container(
        //                   width: 20,
        //                   height: 20,
        //                   decoration: BoxDecoration(shape: BoxShape.circle,
        //                       color:  AppColor.colorlightpurple),
        //                   child: ischecked1
        //                   ? Icon(
        //                     Icons.check,
        //                     size: 20,
        //                     color: Colors.white,
        //                   ) : null,
        //                 ),
        //               ),
        //               GestureDetector(
        //                 onTap: (){
        //                   setState(() {
        //                     ischecked2 = !ischecked2;
        //                   });
        //                 },
        //                 child: Container(
        //                   width: 20,
        //                   height: 20,
        //                   decoration: BoxDecoration(shape: BoxShape.circle,color:AppColor.colorgreen),
        //                   child: ischecked2
        //                   ? Icon(Icons.check,size: 20,
        //                       color: Colors.white,) : null
        //                 ),
        //               ),
        //               GestureDetector(
        //                 onTap: (){
        //                   setState(() {
        //                     ischecked3 = !ischecked3;
        //                   });
        //                 },
        //                 child: Container(
        //                   width: 20,
        //                   height: 20,
        //                   decoration: BoxDecoration(shape: BoxShape.circle,color: AppColor.colororange),
        //                     child: ischecked3
        //                         ? Icon(Icons.check,size: 20,
        //                       color: Colors.white,) : null
        //                 ),
        //               ),
        //               GestureDetector(
        //                 onTap: (){
        //                   setState(() {
        //                     ischecked4 = !ischecked4;
        //                   });
        //                 },
        //                 child: Container(
        //                   width: 20,
        //                   height: 20,
        //                   decoration: BoxDecoration(shape: BoxShape.circle,color: AppColor.colorsky),
        //                     child: ischecked4
        //                         ? Icon(Icons.check,size: 20,
        //                       color: Colors.white,) : null
        //                 ),
        //               ),
        //               GestureDetector(
        //                 onTap: (){
        //                   setState(() {
        //                     ischecked5 = !ischecked5;
        //                   });
        //                 },
        //                 child: Container(
        //                   width: 20,
        //                   height: 20,
        //                   decoration: BoxDecoration(shape: BoxShape.circle,color: AppColor.colordarkpurple),
        //                     child: ischecked5
        //                         ? Icon(Icons.check,size: 20,
        //                       color: Colors.white,) : null
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //         Container(
        //             margin: EdgeInsets.only(top: 15,right: 30,left: 30),
        //             padding: EdgeInsets.symmetric(vertical: 5),
        //             height: 60,
        //             width: 200,
        //             child: ElevatedButton(onPressed: ()
        //             {
        //               // if (Form.of(context)?.validate() ?? false) {
        //               //   OnPressed(context);
        //               // }
        //                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> HomeScreen()),);
        //
        //             }, child: Text("Create",style: TextStyle(color: Colors.white),),
        //               style: ElevatedButton.styleFrom(
        //                   primary: Colors.black,
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(25)
        //
        //                   )),)
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 400,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Quantity",
                        style: TextStyle(fontSize: 20, fontFamily: "FontInter"),
                      ),
                    ),
                  ),
                  const Divider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text("Male"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (malequantity > 0) {
                                        malequantity--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove)),
                              Container(
                                child: Text(
                                  malequantity.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      malequantity++;
                                    });
                                  },
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text("Female"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (femalequantity > 0) {
                                        femalequantity--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove)),
                              Container(
                                child: Text(
                                  femalequantity.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      femalequantity++;
                                    });
                                  },
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text("Couple"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (couplequantity > 0) {
                                        couplequantity--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove)),
                              Container(
                                child: Text(
                                  couplequantity.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      couplequantity++;
                                    });
                                  },
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text("Gender Neutral"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (neutralquantity > 0) {
                                        neutralquantity--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove)),
                              Container(
                                child: Text(
                                  neutralquantity.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      neutralquantity++;
                                    });
                                  },
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                      margin: const EdgeInsets.only(right: 30, left: 30),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      height: 60,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () async {
                          updateDisplayText();
                          Navigator.pop(context);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => CheckBoxExample()),);
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.singupcolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                      )),
                ],
              ),
            );
          });
        });
  }
}
