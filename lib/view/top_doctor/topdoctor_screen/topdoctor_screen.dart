import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/view/Doctor-details/doctordetail_Screen/doctor_details_view.dart';
import 'package:healthcare/view/top_doctor/topdoctor_controller/topdoctor_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/helpful_widget/top_doctor_card.dart';

class TopDoctorsView extends StatelessWidget {
  TopDoctorsView({super.key});
  final TopDoctorsController doctorsController =
      Get.put(TopDoctorsController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final String specialtyId = Get.arguments['specialtyId'];
    final String specialtyName = Get.arguments['specialtyName'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      doctorsController.filterDoctorsBySpecialty(specialtyId, specialtyName);
    });

    return GetBuilder<TopDoctorsController>(
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
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.filteredDoctors.isEmpty
                ? Center(
                    child: Text(
                      "No doctors found for ${controller.selectedSpecialty}",
                      style: FontStyles.articalcontant,
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(SizeConfig.blockWidth * 3),
                    itemCount: controller.filteredDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = controller.filteredDoctors[index];
                      return TopDoctorCard(
                        ontap: () {
                          Get.to(() => DoctorDetailsView(doctorId: doctor.id));
                        },
                        image: doctor.image ?? '',
                        name: doctor.username,
                        specialty: specialtyName,
                        location: doctor.address ?? "Aleppo",
                      );
                    },
                  ),
      ),
    );
  }
}
