import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/res/app_color.dart';

import '../../res/routes/routes_name.dart';
class UserRolescreen extends StatefulWidget {
  const UserRolescreen({super.key});

  @override
  State<UserRolescreen> createState() => _UserRolescreenState();
}

class _UserRolescreenState extends State<UserRolescreen> {
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
      backgroundColor: AppColor.colorblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.colorblack,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),),
        title: const Text("User Roles",style: TextStyle(
          color: Colors.white,fontSize: 25,fontFamily: "FontInter",fontWeight: FontWeight.w400,
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
                borderRadius: BorderRadius.circular(35),color: AppColor.colorblack
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white,
              fontWeight: FontWeight.w400,fontSize: 14),
              decoration: const InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search,color: Colors.white,),
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
                Text("Club1",style: TextStyle(color: Colors.white,
                  decoration: TextDecoration.underline,
                ),),
                Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white,),
              ],
            ),
          ),

          const Divider(color: Colors.white,),
          Expanded(
            child: searchUsers.isNotEmpty
                ? ListView.builder(
              itemCount: searchUsers.length,
              itemBuilder: (context, index)=>GestureDetector(
            onTap: (){
            //  Get.toNamed(RouteName.profilescreen);
            },
            child: Card(
              key: ValueKey(searchUsers[index]["id"]),
              color: AppColor.colorblack,
              margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColor.signinpage,
                  radius: 24,
                  child: Text(searchUsers[index]["id"].toString(),
                    style: const TextStyle(fontSize: 24,color: Colors.white),),
                ),
                title: Text(searchUsers[index]["name"].toString(),
                  style: const TextStyle(color: Colors.white,fontFamily: "FontInter",fontWeight: FontWeight.w400),),
                subtitle: Text(searchUsers[index]["desc"].toString(),
                  style: const TextStyle(color: Colors.white,fontFamily: "FontInter",fontWeight: FontWeight.w200),),
                trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
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
