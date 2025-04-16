import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/service/my_sevice.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Get.putAsync(() => UserService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      initialRoute: Routes.animatedsplash,
    );
  }
}
