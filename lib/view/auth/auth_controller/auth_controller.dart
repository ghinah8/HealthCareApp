import 'dart:convert';

import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/modle/registermodel.dart';
import 'package:healthcare/modle/sgininodel.dart';
import 'package:healthcare/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  bool recovery = true;
  var username = ''.obs;

  void isrcover() {
    recovery = !recovery;
    update();
  }

  // دالة التسجيل (Register) تستخدم Registermoudel
  Future<void> signUp(
      String name, String email, String password, String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': name,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        final registerData =
            Registermoudel.fromJson(jsonData); // استخدام موديل التسجيل

        Get.snackbar('Success', registerData.message,
            duration: Duration(seconds: 6), colorText: Mycolor.black);
        Get.toNamed(Routes.homescreen);
      } else {
        final jsonData = jsonDecode(response.body);
        final errorMessage = jsonData["message"];

        Get.snackbar('Error', errorMessage,
            duration: Duration(seconds: 6), colorText: Mycolor.black);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred. Please try again later.\n$e");
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        final signInData =
            Sgininmoudel.fromJson(jsonData); // استخدام موديل تسجيل الدخول
        final usernamefromapi = signInData.user.username;
        username.value = usernamefromapi;
        // حفظ الاسم في SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', usernamefromapi);

        // تحديث المتغير username لعرضه باستخدام GetX
        username.value = usernamefromapi;

        Get.snackbar('Success', signInData.message,
            duration: Duration(seconds: 6), colorText: Mycolor.black);
        Get.toNamed(Routes.homescreen);
      } else {
        final jsonData = jsonDecode(response.body);
        final errorMessage = jsonData["message"];

        Get.snackbar('Error', errorMessage,
            duration: Duration(seconds: 6), colorText: Mycolor.black);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred. Please try again later.\n$e");
    }
  }
}
