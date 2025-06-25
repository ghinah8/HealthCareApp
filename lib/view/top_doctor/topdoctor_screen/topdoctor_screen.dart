import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/view/top_doctor/topdoctor_controller/topdoctor_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/helpful_widget/top_doctor_card.dart';

class TopDoctorsView extends StatelessWidget {
  const TopDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final String specialty = Get.arguments['specialty'];

    return GetBuilder<TopDoctorsController>(
      init: TopDoctorsController()..filterDoctorsBySpecialty(specialty),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: Backbutton(),
          title: Text(controller.selectedSpecialty, style: FontStyles.findyour),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Mycolor.white,
          foregroundColor: Mycolor.black,
          toolbarHeight: 100,
        ),
        backgroundColor: Mycolor.white,
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.blockWidth * 3),
          child: controller.filteredDoctors.isEmpty
              ? Center(
                  child: Text(
                      "No doctors found for ${controller.selectedSpecialty}"))
              : ListView.builder(
                  itemCount: controller.filteredDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = controller.filteredDoctors[index];
                    return TopDoctorCard(
                      image: doctor['image'] ?? '',
                      name: doctor['name'] ?? '',
                      specialty: doctor['specialty'] ?? '',
                      rating: doctor['rating'] ?? '',
                      distance: doctor['distance'] ?? '',
                    );
                  },
                ),
        ),
      ),
    );
  }
}
