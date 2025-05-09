import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healthcare/service/my_sevice.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  Rx<File> image = File('').obs;
  var username = ''.obs; // حفظ اسم المستخدم ليظهر في الواجهة

  @override
  void onInit() {
    super.onInit();
    loadUsername(); // تحميل الاسم عند فتح الصفحة
  }

  Future imagePicker() async {
    try {
      final imagepick =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagepick == null) {
        return;
      }
      update();
      final imagetemp = File(imagepick.path);
      image.value = imagetemp;
    } on PlatformException catch (e) {
      return e;
    }
  }

  // تحميل اسم المستخدم المخزن في `UserService`
  Future<void> loadUsername() async {
    final userService = Get.find<UserService>();
    String? storedUsername =
        await userService.getUsername(fromPreferences: true);
    username.value =
        storedUsername ?? 'Guest'; // تعيين قيمة افتراضية إذا لم يوجد اسم
  }
}
