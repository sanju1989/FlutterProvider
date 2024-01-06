import 'package:flutter/material.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/view/home/MainScreen.dart';

import '../../colors.dart';
class SocialMedia2 extends StatefulWidget {
  const SocialMedia2({super.key});

  @override
  State<SocialMedia2> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.singupcolor,

      body: Padding(padding: EdgeInsets.all(20),
     child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50,),
           Container(margin: EdgeInsets.only(top: 2,left: 30),
           child:Text("Social Media",style: TextStyle(color: AppColor.colorblack,
               fontSize: 30,fontFamily: "FontInter")),),

        Container(margin: EdgeInsets.only(top: 2,left: 30),
           child: Text("Connect To",style: TextStyle(color: AppColor.colorblack,
                fontSize: 15,fontFamily: "FontInter"),),),

          SizedBox(height: 30,),
          Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
           // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 30,
                child: Image.asset("images/black_insta_icon.png"),
                //child: Text("Instagram",style: TextStyle(color: Colors.black),),
              ),
              Container(
                child: Text("Instagram"),
              ),
              Container(
                // padding: EdgeInsets.only(left: 20,),
                child: IconButton(onPressed: (){

                }, icon: Icon(Icons.keyboard_arrow_right)),
              )
            ],
          ),
          Divider(color:Colors.white ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 30,
                child: Image.asset("images/black_fb_icon.png"),
                //child: Text("Instagram",style: TextStyle(color: Colors.black),),
              ),
              Container(
                child: Text("Facebook"),
              ),
              Container(
                 padding: EdgeInsets.only(left: 2,),
                child: IconButton(onPressed: (){

                }, icon: Icon(Icons.keyboard_arrow_right)),
              )
            ],
          ),
          Divider(color:Colors.white ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 30,
                child: Image.asset("images/black_twitter_icon.png"),
                //child: Text("Instagram",style: TextStyle(color: Colors.black),),
              ),
              Container(
                child: Text("Twitter"),
              ),
            Container(
              padding: EdgeInsets.only(left: 20,),
              child: IconButton(onPressed: (){
                
              }, icon: Icon(Icons.keyboard_arrow_right)),
            )
            //  Icon(Icons.keyboard_arrow_right),
            ],
          ),
          Divider(color:Colors.white ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 30,
                child: Image.asset("images/black_text_icon.png"),
                //child: Text("Instagram",style: TextStyle(color: Colors.black),),
              ),
              Container(
                child: Text("Message"),
              ),
              Container(
                padding: EdgeInsets.only(left: 2,),
                child: IconButton(onPressed: (){

                }, icon: Icon(Icons.keyboard_arrow_right)),
              )
            ],
          ),
          ],),

          SizedBox(height: 50,),
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
                            builder: (context) => MainScreen()),
                      );
                      // Handle button 1 press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: homecolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    child: Text(
                      'Skip',

                      style: TextStyle(fontSize: 12, fontFamily: 'FontIner', color: AppColor.colorblack,
                          fontWeight: FontWeight.w400),
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
                            builder: (context) => MainScreen()),
                      );
                    },
                    child: Text(
                      'Finish (3/3)',
                      style: TextStyle(fontFamily: 'FontIner',fontSize: 12,color: Colors.white,fontWeight: FontWeight.w400),
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
      ),
      ),
    );
  }
}
