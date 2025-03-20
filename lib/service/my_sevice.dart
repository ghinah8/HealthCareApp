// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get.dart';

// class MyService extends GetxService {
//   late SharedPreferences sharedPreferences;
//   String? _token; // تخزين التوكن في الذاكرة

//   Future<MyService> init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     _token = sharedPreferences.getString('token'); // استرجاع التوكن
//     return this;
//   }

//   // حفظ التوكن في الذاكرة أو SharedPreferences
//   Future<void> saveToken(String token, {bool saveToPreferences = false}) async {
//     _token = token; // تخزين التوكن في الذاكرة
//     if (saveToPreferences) {
//       await sharedPreferences.setString('token', token);
//     }
//     print('Token saved: $token');
//   }

//   // استرجاع التوكن
//   Future<String?> getAccessToken({bool fromPreferences = false}) async {
//     if (fromPreferences) {
//       return sharedPreferences.getString('token'); // من التخزين
//     }
//     return _token; // من الذاكرة
//   }

//   // التحقق من حالة تسجيل الدخول
//   Future<bool> isUserLoggedIn() async {
//     return _token != null || sharedPreferences.getString('token') != null;
//   }

//   // حذف التوكن
//   Future<void> clearToken() async {
//     _token = null; // حذف من الذاكرة
//     await sharedPreferences.remove('token'); // حذف من التخزين
//     print('Token cleared');
//   }
// }

// initialServices() async {
//   await Get.putAsync(() => MyService().init());
// }
