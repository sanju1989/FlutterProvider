import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skdoosh/res/routes/routes_name.dart';

import '../../res/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: AllStaffStarScreen(),
    );
  }
}

class AllStaffStarScreen extends StatefulWidget {
  const AllStaffStarScreen({Key? key}) : super(key: key);

  @override
  State<AllStaffStarScreen> createState() => _AllStaffStarScreen();
}

class _AllStaffStarScreen extends State<AllStaffStarScreen> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": "A", "name": "Andy", "age": "Designation, Club Name "},
    {"id": "A", "name": "Aragon", "age": 40},
    {"id": "B", "name": "Bob", "age": 5},
    {"id": "B", "name": "Barbara", "age": 35},
    {"id": "C", "name": "Candy", "age": 21},
    {"id": "C", "name": "Colin", "age": 55},
    {"id": "A", "name": "Audra", "age": 30},
    {"id": "B", "name": "Banana", "age": 14},
    {"id": 'C', "name": "Caversky", "age": 100},
    {"id": "B", "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("All Stars",style: TextStyle(color: Colors.black,fontSize: 25),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
              Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(25),
              ),
              width: double.infinity,
              height: 50,
              child: TextField(
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'FontInter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                // controller: emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColor.black303030,
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) => _runFilter(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Club1",style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),),
                   Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteName.profilescreen);
                  },
                  child: Card(
                    key: ValueKey(_foundUsers[index]["id"]),
                    // color: Colors.amberAccent,
                    // elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        child: Text(
                          _foundUsers[index]["id"].toString(),
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      title: Text(_foundUsers[index]['name']),
                      subtitle: Text(
                          '${_foundUsers[index]["age"].toString()} years old'),
                        trailing: Icon(Icons.arrow_forward_ios)
                    ),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}