import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EligibilityController extends GetxController {
  var chronicConditions = RxnBool();
  var surgeries = RxnBool();
  var hereditaryConditions = RxnBool();
  var medications = RxnBool();
  var allergies = RxnBool();

  final medicationsController = TextEditingController();
  final allergiesController = TextEditingController();

  int get completedSteps {
    int count = 0;
    if (chronicConditions.value != null) count++;
    if (surgeries.value != null) count++;
    if (hereditaryConditions.value != null) count++;
    if (medications.value != null) count++;
    if (allergies.value != null) count++;
    return count;
  }

  @override
  void onClose() {
    medicationsController.dispose();
    allergiesController.dispose();
    super.onClose();
  }
}
