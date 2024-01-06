import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/view/staff/addduties.dart';
import 'package:skdoosh/view/staff/supervisorsearchview.dart';
import 'package:skdoosh/view_models/employee_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/routes/routes_name.dart';

class CreateSupervisor extends StatefulWidget {
  const CreateSupervisor({super.key});

  @override
  State<CreateSupervisor> createState() => _CreateSupervisorState();
}

class _CreateSupervisorState extends State<CreateSupervisor> {
  EmployeeViewModel employeeViewModel = EmployeeViewModel();
  var designationType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeViewModel.fetchEmployeeList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Create Employee',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'FontInter', fontSize: 27),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: 50,
              child: ChangeNotifierProvider<EmployeeViewModel>(
                  create: (BuildContext context) => employeeViewModel,
                  child: Consumer<EmployeeViewModel>(
                      builder: (context, value, _) {
                        switch (value.employeelist.status) {
                          case Status.LOADING:
                            return SizedBox(
                              height: 50,
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            );
                          case Status.ERROR:
                            return Text(
                                value.employeelist.message.toString());
                          case Status.COMPLETED:
                            debugPrint(value
                                .employeelist.data!.data!.length
                                .toString());
                            List<DropdownMenuItem<String>> s =
                            List.generate(
                              value.employeelist.data!.data!.length,
                                  (index) => DropdownMenuItem(
                                value: value.employeelist.data!
                                    .data![index].employeTypeId
                                    .toString(),
                                child: Text(
                                    "${value.employeelist.data!.data![index].employeType}"),
                              ),
                            );
                            // _popularMovieList(value);
                            return DropdownButton(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              items: s,
                              hint: Text('Designation'),
                              value: designationType,
                              onChanged: (value) {
                                setState(() {
                                  designationType = value.toString();
                                  debugPrint("ctgryid$designationType");
                                });
                              },
                            );
                          default:
                            return const Text("TTTT");
                        }
                      }))
              // TextField(
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontFamily: 'FontInter',
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500),
              //   // controller: emailcontroller,
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Designation',
              //   ),
              //   keyboardType: TextInputType.text,
              // ),
            ),
            //first name container
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
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
                  hintText: 'Name',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            //phone number container
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
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
                  hintText: 'Phone Number',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            //confirm phone number
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
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
                  hintText: 'Confirm Phone Number',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            //Email id container
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: AppColor.primaryBg),
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(5),
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
                  hintText: 'Email id',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 40, right: 40),
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(35),
              ),
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
              //    Get.toNamed(RouteName.neweventclub);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AddDuties()),
                  // );
                },
                child: const Text(
                  'Create',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'FontInter',
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
