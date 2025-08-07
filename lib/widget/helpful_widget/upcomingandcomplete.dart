// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/view/allappointment/allapointment_controller/allappointment_controller.dart';

class Upcomingandcomplete extends StatelessWidget {
  final String text;
  final AppointmentFilter filter;

  const Upcomingandcomplete({required this.text, required this.filter});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllappointmentController>();
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Obx(() {
        final isSelected = controller.selectedFilter.value == filter;
        return GestureDetector(
          onTap: () => controller.changeFilter(filter),
          child: Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: isSelected
                  ? Mycolor.lightblue
                  : Mycolor.lightgrey.withAlpha(30),
            ),
            child: Center(
              child: Text(
                text,
                style: isSelected
                    ? FontStyles.allappointment2
                    : FontStyles.allappointment,
              ),
            ),
          ),
        );
      }),
    );
  }
}
