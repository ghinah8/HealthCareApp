// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:get/get.dart';
import 'package:healthcare/modle/crateAppointment.dart';
import 'package:healthcare/modle/getOneDoctor.dart';
import 'package:healthcare/service/link.dart';
import 'package:http/http.dart' as http;

class Doctordetailescontroller extends GetxController {
  bool isLoading = false;
  GetnOneDoctor? doctor;
  Future<void> fetchDoctorDetails(String doctorId) async {
    try {
      isLoading = true;
      update();
      final response = await http.get(Uri.parse(AppLink.getOneDoctor(doctorId)),
          headers: AppLink.getHeader());

      if (response.statusCode == 200) {
        doctor = getnOneDoctorFromJson(response.body);
      }
    } catch (e) {
      Get.snackbar("Exception: $e", '$e');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> createAppointment(CreateAppointment order) async {
    try {
      isLoading = true;
      final response = await http.post(
        Uri.parse(AppLink.createOrder),
        headers: {
          "Content-Type": "application/json",
          ...AppLink.getHeader(),
        },
        body: jsonEncode(order.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "your Appointment is at: ${order.startHour}");
      } else {
        Get.snackbar("Error", "Failed: ${response.statusCode} ");
        print(response.body);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading = false;
    }
  }
}
