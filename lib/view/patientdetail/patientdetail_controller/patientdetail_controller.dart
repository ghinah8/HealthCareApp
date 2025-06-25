import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/modle/patient_model.dart';

class PatientController extends GetxController {
  // متغيرات النموذج والتحكم
  var patient = PatientModel().obs;

  final RxString selectedDay = ''.obs;
  final RxString selectedMonth = ''.obs;
  final RxString selectedYear = ''.obs;

  // المتحكمات لحقول النص
  var nameController = TextEditingController().obs;
  var ageController = TextEditingController().obs;

  // حالة تتبع الخطوات
  var currentStep = 0.obs;
  final int totalSteps = 3; // إجمالي عدد الخطوات

  // دالة تحديث حالة الخطوات
  void updateSteps() {
    int count = 0;
    if (patient.value.name != null && patient.value.name!.isNotEmpty) count++;
    if (patient.value.age != null && patient.value.age!.isNotEmpty) count++;
    if (patient.value.gender != null && patient.value.gender!.isNotEmpty) {
      count++;
    }

    currentStep.value = count;
    update();
  }

  // تهيئة القيم الافتراضية عند البداية
  @override
  void onInit() {
    super.onInit();
    nameController.value.text = patient.value.name ?? '';
    ageController.value.text = patient.value.age ?? '';
  }

  @override
  void onClose() {
    // تنظيف المتحكمات عند التدمير
    nameController.value.dispose();
    ageController.value.dispose();

    super.onClose();
  }
}
