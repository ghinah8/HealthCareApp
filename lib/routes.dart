import 'package:get/get.dart';
import 'package:healthcare/view/auth/login/login_screen.dart';
import 'package:healthcare/view/auth/sginin/sginin_screen.dart';
import 'package:healthcare/view/home/homw_screen/home_screen.dart';
import 'package:healthcare/view/mysaved/mysaved_screen/mysaved_screen.dart';
import 'package:healthcare/view/pharmacy/pharmcy_screen/pharmacy_screen.dart';
import 'package:healthcare/view/profile/profile_screen/profile_screen.dart';
import 'package:healthcare/view/splash_screen/secondscreen.dart';
import 'package:healthcare/view/splash_screen/splashanimated.dart';
import 'package:healthcare/view/splash_screen/thirdscreen.dart';

class Routes {
  static const String signupscreen = '/sign_up_screen';
  static const String loginscreen = '/log_in_screen';
  static const String homescreen = '/home_screen';
  static const String profilescreen = '/profile_screen';
  static const String animatedsplash = '/splashanimated';
  static const String secondsplashscreen = '/secondsplash';
  static const String thirdsplashscreen = '/thirdsplash';
  static const String mysaved = '/mysaved';
  static const String pharmacy = '/pharmacy';

  static final List<GetPage> pages = [
    GetPage(name: '/home_screen', page: () => HomeScreen()),
    GetPage(name: '/sign_up_screen', page: () => SignupScreen()),
    GetPage(name: '/log_in_screen', page: () => LoginScreen()),
    GetPage(name: '/profile_screen', page: () => const ProfileScreen()),
    GetPage(name: '/splashanimated', page: () => splash_animated()),
    GetPage(name: '/secondsplash', page: () => secondscreen()),
    GetPage(name: '/thirdsplash', page: () => thirdscreen()),
    GetPage(name: '/mysaved', page: () => MysavedScreen()),
    GetPage(name: '/pharmacy', page: () => PharmacyScreen()),
  ];
}
