import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/view/patientdetail/patientdetail_controller/patientdetail_controller.dart';

class AgeDropdownField extends StatelessWidget {
  final PatientController controller = Get.find();

  final List<String> days =
      List.generate(31, (index) => (index + 1).toString());
  final List<String> months =
      List.generate(12, (index) => (index + 1).toString());
  final List<String> years = List.generate(
    100,
    (index) => (DateTime.now().year - index).toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDropdown('Day', days, controller.selectedDay),
        _buildDropdown('Month', months, controller.selectedMonth),
        _buildDropdown('Year', years, controller.selectedYear),
      ],
    );
  }

  Widget _buildDropdown(
      String label, List<String> items, RxString selectedValue) {
    return Obx(() => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: label,
                labelStyle: FontStyles.lablepatientname,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Mycolor.lightblue)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Mycolor.lightgrey),
                ),
              ),
              value: selectedValue.value.isEmpty ? null : selectedValue.value,
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: FontStyles.categoriess),
                );
              }).toList(),
              onChanged: (newValue) {
                selectedValue.value = newValue!;
                controller.patient.update((val) {
                  if (controller.selectedDay.value.isNotEmpty &&
                      controller.selectedMonth.value.isNotEmpty &&
                      controller.selectedYear.value.isNotEmpty) {
                    val?.age =
                        '${controller.selectedDay.value}/${controller.selectedMonth.value}/${controller.selectedYear.value}';
                  } else {
                    val?.age = '';
                  }
                });
                controller.updateSteps();
              },
            ),
          ),
        ));
  }
}
