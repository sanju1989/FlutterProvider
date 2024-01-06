import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/res/app_color.dart';
class EditVenueScreen extends StatefulWidget {
  const EditVenueScreen({super.key});

  @override
  State<EditVenueScreen> createState() => _EditVenueScreenState();
}

class _EditVenueScreenState extends State<EditVenueScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(handleTabChange);
  }
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  void handleTabChange() {
    setState(() {
      _currentIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.colorblack,
        appBar: AppBar(
          backgroundColor: AppColor.colorblack,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          title: Text("Edit Venues",style: TextStyle(color: Colors.white,
              fontFamily: "FontInter",fontWeight: FontWeight.w400,fontSize: 25),),
          centerTitle: true,

          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Text("Venue Profile",style: TextStyle(
                  color: _currentIndex == 0 ? AppColor.colorwhite : AppColor.tabtextcolor,
                ),),
              ),
              Tab(
                child: Text("A/c Details",style: TextStyle(
                  color: _currentIndex == 1 ? AppColor.colorwhite : AppColor.tabtextcolor,

                ),),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Center(
              child: _currentIndex == 0
                  ?
              Column(
                children: [
                  SizedBox(height: 50,),
                  Text("Address",style: TextStyle(color: AppColor.colorwhite,
                      fontFamily: "FontInter",fontWeight: FontWeight.w400),),
                  Container(
                    width: double.infinity,
                    height: 100,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    decoration: BoxDecoration(color: AppColor.colorwhite,
                        borderRadius: BorderRadius.circular(5)),
                    
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("123 Random Address\nRandom City-123456",style: TextStyle(color: AppColor.addresstextcolor,
                          fontFamily: "FontInter",fontWeight: FontWeight.w300,fontSize: 20),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Phone Number",style: TextStyle(color: AppColor.colorwhite,
                      fontFamily: "FontInter",fontWeight: FontWeight.w400),),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(left: 30,right: 30),
                    decoration: BoxDecoration(color: AppColor.colorwhite,
                        borderRadius: BorderRadius.circular(5)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("1234567890",style: TextStyle(color: AppColor.addresstextcolor,
                          fontFamily: "FontInter",fontWeight: FontWeight.w300,fontSize: 20),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Email Id",style: TextStyle(color: AppColor.colorwhite,
                      fontFamily: "FontInter",fontWeight: FontWeight.w400),),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(left:30,right: 30),
                    decoration: BoxDecoration(color: AppColor.colorwhite,
                        borderRadius: BorderRadius.circular(5)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("data@gmail.com",style: TextStyle(color: AppColor.addresstextcolor,
                          fontFamily: "FontInter",fontWeight: FontWeight.w300,fontSize: 20),),
                    ),
                  ),
                  SizedBox(height: 40,),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => VenueDetails()),
                          // );
                          // Handle button 1 press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryBg,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child:Text('Save',
                              style: TextStyle(fontSize: 12, fontFamily: 'FontIner', color: Colors.white),
                            ),

                    ),
                  ),
                ],
              ): SizedBox.shrink(),
            ),
            Center(
              child: _currentIndex == 1
                  ?
              Column(
            children: [
            SizedBox(height: 50,),
            Text("Account name",style: TextStyle(color: AppColor.colorwhite,
                fontFamily: "FontInter",fontWeight: FontWeight.w400),),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(color: AppColor.colorwhite,
                  borderRadius: BorderRadius.circular(5)),

              child: Align(
                alignment: Alignment.center,
                child: Text("Ravi",style: TextStyle(color: AppColor.addresstextcolor,
                    fontFamily: "FontInter",fontWeight: FontWeight.w300,fontSize: 20),),
              ),
            ),
            SizedBox(height: 20,),
            Text("Account Number",style: TextStyle(color: AppColor.colorwhite,
                fontFamily: "FontInter",fontWeight: FontWeight.w400),),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 30,right: 30),
              decoration: BoxDecoration(color: AppColor.colorwhite,
                  borderRadius: BorderRadius.circular(5)),
              child: Align(
                alignment: Alignment.center,
                child: Text("1234567890",style: TextStyle(color: AppColor.addresstextcolor,
                    fontFamily: "FontInter",fontWeight: FontWeight.w300,fontSize: 20),),
              ),
            ),
            SizedBox(height: 20,),
            Text("IFSC Code",style: TextStyle(color: AppColor.colorwhite,
                fontFamily: "FontInter",fontWeight: FontWeight.w400),),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left:30,right: 30),
              decoration: BoxDecoration(color: AppColor.colorwhite,
                  borderRadius: BorderRadius.circular(5)),
              child: Align(
                alignment: Alignment.center,
                child: Text("IHFC0009",style: TextStyle(color: AppColor.addresstextcolor,
                    fontFamily: "FontInter",fontWeight: FontWeight.w300,fontSize: 20),),
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => VenueDetails()),
                  // );
                  // Handle button 1 press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryBg,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child:Text('Save',
                  style: TextStyle(fontSize: 12, fontFamily: 'FontIner', color: Colors.white),
                ),

              ),
            ),
          ],
        ): SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

}
