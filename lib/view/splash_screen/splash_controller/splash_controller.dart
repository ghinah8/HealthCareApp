// lib/controller/splash_controller.dart

import 'package:get/get.dart';
import 'dart:async';

import 'package:healthcare/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 15), () {
      Get.offNamed(Routes.secondsplashscreen);
    });
  }
}
