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
      // title: 'Kindacode.com',
      home: SupervisorScreen(),
    );
  }
}

class SupervisorScreen extends StatefulWidget {
  const SupervisorScreen({Key? key}) : super(key: key);

  @override
  State<SupervisorScreen> createState() => _SupervisorScreen();
}

class _SupervisorScreen extends State<SupervisorScreen> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allSupervisor = [
    {"id": 1, "name": "Shweta Singh", "age": "Designation, Club Name "},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _supervisor = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _supervisor = _allSupervisor;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _superior(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allSupervisor;
    } else {
      results = _allSupervisor
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _supervisor = results;
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
        title: Text("Supervisors",style: TextStyle(color: Colors.black,fontSize: 25),),
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
                onChanged: (value) => _superior(value),
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



            // TextField(
            //   onChanged: (value) => _runFilter(value),
            //   decoration: const InputDecoration(
            //       labelText: 'Search', suffixIcon: Icon(Icons.search)),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            Expanded(
              child: _supervisor.isNotEmpty
                  ? ListView.builder(
                itemCount: _supervisor.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteName.profilescreen);
                  },
                  child: Card(
                    key: ValueKey(_supervisor[index]["id"]),
                    // color: Colors.amberAccent,
                    // elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          child: Text(
                            _supervisor[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        title: Text(_supervisor[index]['name']),
                        subtitle: Text(
                            '${_supervisor[index]["age"].toString()} '),
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