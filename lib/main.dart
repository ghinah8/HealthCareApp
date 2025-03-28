import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      initialRoute: Routes.pharmacyScreen,
    );
  }
}
