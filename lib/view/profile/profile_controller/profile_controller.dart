import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  Rx<File> image = File('').obs;

  Future imagePicker() async {
    try {
      final imagepick =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagepick == null) {
        return;
      }
      final imagetemp = File(imagepick.path);
      image.value = imagetemp;
    } on PlatformException catch (e) {
      return e;
    }
  }
}
