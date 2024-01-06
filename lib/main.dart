import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:skdoosh/res/routes/routes.dart';
import 'package:skdoosh/res/strings.dart';
import 'package:skdoosh/view/welcomescreen.dart';
import 'package:skdoosh/view_models/AuthViewModel.dart';

import 'colors.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //initialBinding: Binding(),
        title: SKDOOSH,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: '/',
        getPages: AppRoutes.appRoutes(),
      ),
    );
  }
}