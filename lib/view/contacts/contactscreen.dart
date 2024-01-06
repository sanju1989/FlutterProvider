import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/view/contacts/infocontact.dart';

import '../../res/routes/routes_name.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final List<Map<String, dynamic>> allusers = [
    {"id": "A", "name": "Shweta Singh", "desc": "Designation, Club Name "},
    {"id": "A", "name": "Aragon", "desc": "Supervisor"},
    {"id": "B", "name": "Bob", "desc": "Manager"},
    {"id": "B", "name": "Barbara", "desc": "Worker"},
    {"id": "C", "name": "Candy", "desc": "Branch Manager"},
    {"id": "C", "name": "Colin", "desc": 55},
    {"id": "A", "name": "Audra", "desc": 30},
    {"id": "B", "name": "Banana", "desc": 14},
    {"id": 'C', "name": "Caversky", "desc": 100},
    {"id": "B", "name": "Becky", "desc": 32},
  ];

  List<Map<String, dynamic>> searchUsers = [];
  @override
  initState() {

    searchUsers = allusers;
    super.initState();
  }

  void search(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = allusers;
    } else {
      results = allusers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      searchUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.colorwhite,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios,color: AppColor.colorblack,),),
        title: const Text("Contacts",style: TextStyle(
          color: Colors.black,fontSize: 25,fontFamily: "FontInter",fontWeight: FontWeight.w400,
        ),),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30,right: 30,top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(border: Border.all(color: AppColor.lighPrimaryBg, width: 2),
                  borderRadius: BorderRadius.circular(35),color: AppColor.colorwhite
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w400,fontSize: 14),
                decoration: const InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search,color: AppColor.colorblack,),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) => search(value),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Club1",style: TextStyle(color: AppColor.colorblack,
                    decoration: TextDecoration.underline,
                  ),),
                  Icon(Icons.keyboard_arrow_down_rounded,color: AppColor.colorblack,),
                ],
              ),
            ),

            const Divider(),
            Expanded(
              child: searchUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: searchUsers.length,
                itemBuilder: (context, index)=>GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoContact()));
                  },
                  child: Card(
                    key: ValueKey(searchUsers[index]["id"]),
                    color: AppColor.colorwhite,
                    margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.signinpage,
                        radius: 24,
                        child: Text(searchUsers[index]["id"].toString(),
                          style: const TextStyle(fontSize: 24,color: Colors.white),),
                      ),
                      title: Text(searchUsers[index]["name"].toString(),
                        style: const TextStyle(color: AppColor.colorblack,fontFamily: "FontInter",fontWeight: FontWeight.w400),),
                      subtitle: Text(searchUsers[index]["desc"].toString(),
                        style: const TextStyle(color: AppColor.colorblack,fontFamily: "FontInter",fontWeight: FontWeight.w200),),
                      trailing: const Icon(Icons.arrow_forward_ios,color: AppColor.colorblack,size: 20,),
                    ),
                  ),
                ),
              )
                  : const Text("No Result found",
                style: TextStyle(fontSize: 24,color: Colors.white),),

            )
          ],
        ),),
    );
  }
}
