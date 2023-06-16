import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/pages/home.dart';
import 'package:notepad/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: page,
      initialRoute: homePage,
      home: HomePage(),
    );
  }
}
