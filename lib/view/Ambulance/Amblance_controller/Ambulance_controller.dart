import 'dart:convert';

import 'package:get/get.dart';
import 'package:healthcare/modle/createAmbulanceorder.dart';
import 'package:healthcare/modle/getallambulance.dart';
import 'package:healthcare/service/link.dart';
import 'package:http/http.dart' as http;

class AmbulanceController extends GetxController {
  bool isLoading = false;
  List<Ambulance> ambulanceCar = []; // لاحظ النوع صار Ambulance مو List عادي
  Ambulance? selectedAmbulance; // ✅ السيارة المختارة

  void selectAmbulance(Ambulance ambulance) {
    selectedAmbulance = ambulance;
    update(); // يحدث الواجهة
  }

  Future<void> fetchAmbulance() async {
    try {
      isLoading = true;
      update();

      final response = await http.get(
        Uri.parse(AppLink.getallAmbulance),
        headers: AppLink.getHeader(),
      );

      if (response.statusCode == 200) {
        final data = getallAmbulanceFromJson(response.body);

        /// نخزن السيارات فقط
        ambulanceCar = data.ambulances;
      } else {
        Get.snackbar("Error", "Failed to load ambulances");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading = false;
      update(); // مهم يحدث الواجهة بعد ما يخلص
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAmbulance(); // استدعاء اول ما يفتح الكنترولر
  }

  Future<void> createAmbulanceOrder(CreateAmbulanceOrder order) async {
    try {
      isLoading = true;
      update();

      final response = await http.post(
        Uri.parse(AppLink.createOrder),
        headers: {
          "Content-Type": "application/json", // ✅ مهم جداً
          ...AppLink.getHeader(),
        },
        body: jsonEncode(order.toJson()), // ✅ إرسال JSON
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
            "Success", "The car will be in the location at ${order.endHour} ");
      } else {
        Get.snackbar(
            "Error", "Failed: ${response.statusCode} → ${response.body}");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }
}
