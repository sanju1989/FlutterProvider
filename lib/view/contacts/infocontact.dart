import 'package:flutter/material.dart';
import 'package:skdoosh/res/app_color.dart';
class InfoContact extends StatefulWidget {
  const InfoContact({super.key});

  @override
  State<InfoContact> createState() => _InfoContactState();
}

class _InfoContactState extends State<InfoContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.colorwhite,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: AppColor.colorblack,)),
        title: Text("Contact Info",style: TextStyle(color: AppColor.colorblack,
            fontFamily: "FontInter",fontWeight: FontWeight.w400),),
        centerTitle: true,
      ),

      body: SingleChildScrollView(child:
      Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(alignment: Alignment.center,
       child: CircleAvatar(
          backgroundColor: AppColor.greyD9D9D9,
          radius: 80,
          child: Text("A",style: TextStyle(fontSize: 40),),
         foregroundColor: Colors.black,
        )),
          Container(
            margin: EdgeInsets.only(top: 30,left: 30,right: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
              color: AppColor.colorwhite,
              borderRadius: BorderRadius.circular(5),

            ),
            width: double.infinity,
            height: 50,
            child: TextField(
              // controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 30,right: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
              color: AppColor.colorwhite,
              borderRadius: BorderRadius.circular(5),

            ),
            width: double.infinity,
            height: 50,
            child: TextField(
              // controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Phone Number',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 30,right: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
              color: AppColor.colorwhite,
              borderRadius: BorderRadius.circular(5),

            ),
            width: double.infinity,
            height: 50,
            child: TextField(
              // controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'E-mail',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 30,right: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
              color: AppColor.colorwhite,
              borderRadius: BorderRadius.circular(5),

            ),
            width: double.infinity,
            height: 50,
            child: TextField(
              // controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Company Name',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 15,right: 30,left: 30),
              padding: EdgeInsets.symmetric(vertical: 5),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(onPressed: () async
              {
             //   Get.toNamed(RouteName.ticketscreen);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => NewEventClub()),);
              }, child: Text("Add",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)

                    )),)
          ),
      ],),),
    );
  }
}
