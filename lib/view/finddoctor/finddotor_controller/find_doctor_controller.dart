import 'dart:convert';

import 'package:get/get.dart';
import 'package:healthcare/modle/getallspesifics.dart';
import 'package:healthcare/service/link.dart';
import 'package:http/http.dart' as http;

class FindDoctorController extends GetxController {
  RxList<Specific> specifics = <Specific>[].obs;
  RxBool isloading = false.obs;

  @override
  void onInit() {
    super.onInit();
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
        final model = specificsFromJson(response.body);
        specifics.value = model.specifics;
      } else {
        final jsondata = jsonDecode(response.body);

        final errormessage = jsondata['message'];
        Get.snackbar('check the internet', '$errormessage');
        print(errormessage);
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
      print("#########$e");
    } finally {
      isloading.value = false;
    }
  }

  Future<String> fetchSpecificNameById(String id) async {
    try {
      final response = await http.get(
        Uri.parse(
            "${AppLink.specifics}/$id"), // مثلاً: /api/specifics/68acde2276ef0a875efa8c65
        headers: AppLink.getHeader(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['name'] ?? "Unknown"; // حسب شكل الريسبونس
      } else {
        print("Error: ${response.body}");
        return "Unknown";
      }
    } catch (e) {
      print("Exception: $e");
      return "Unknown";
    }
  }
}
