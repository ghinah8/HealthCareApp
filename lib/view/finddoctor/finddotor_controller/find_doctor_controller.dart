import 'dart:convert';

import 'package:get/get.dart';
import 'package:healthcare/modle/getallspesifics.dart';
import 'package:healthcare/service/link.dart';
import 'package:http/http.dart' as http;

class FindDoctorController extends GetxController {
  RxList<Specialty> speialty = <Specialty>[].obs;
  RxBool isloading = false.obs;

  @override
  void onInit() {
    fetchspecifics();
    super.onInit();
  }

  Future<void> fetchspecifics() async {
    try {
      isloading.value = true;
      final response = await http.get(
        Uri.parse(AppLink.specifics),
        headers: AppLink.getHeader(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final model = specialtiesModelFromJson(response.body);
        speialty.value = model.specifics;
        update();
      } else {
        final jsondata = jsonDecode(response.body);

        final errormessage = jsondata['message'];
        Get.snackbar('check the internet', '$errormessage');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
