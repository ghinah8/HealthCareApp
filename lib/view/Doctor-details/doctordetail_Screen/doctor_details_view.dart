// view/view/doctor_details_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/service/link.dart';
import 'package:healthcare/view/Doctor-details/doctordetail_controller/doctordetailesController.dart';
import 'package:healthcare/view/finddoctor/finddotor_controller/find_doctor_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';

class DoctorDetailsView extends StatelessWidget {
  final String doctorId;
  const DoctorDetailsView({super.key, required this.doctorId});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final controller = Get.put(Doctordetailescontroller());
    controller.fetchDoctorDetails(doctorId);

    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Mycolor.white,
        leading: Backbutton(),
        title: Text('Doctor Details', // استبدلها بالعنوان المناسب
            style: FontStyles.authtitle),
      ),
      body: GetBuilder<Doctordetailescontroller>(
        init: Doctordetailescontroller()..fetchDoctorDetails(doctorId),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.doctor == null) {
            return const Center(child: Text("No doctor data"));
          }

          final doc = controller.doctor!;

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockWidth * 5,
                vertical: SizeConfig.blockHeight * 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Info Card
                  Container(
                    padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
                    decoration: BoxDecoration(
                      color: Mycolor.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Mycolor.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            AppLink.fixImageUrl(doc.image),
                            width: SizeConfig.blockWidth * 25,
                            height: SizeConfig.blockWidth * 25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: SizeConfig.blockWidth * 4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(doc.username, style: FontStyles.authtitle),
                              FutureBuilder<String>(
                                future: Get.find<FindDoctorController>()
                                    .fetchSpecificNameById(doc.specific),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text("Loading...",
                                        style: FontStyles.sgininanotherway);
                                  }
                                  if (snapshot.hasError) {
                                    return Text("Unknown",
                                        style: FontStyles.sgininanotherway);
                                  }
                                  return Text(snapshot.data ?? "Unknown",
                                      style: FontStyles.sgininanotherway);
                                },
                              ),
                              Text('\$${doc.pricePerHour}/hr',
                                  style: FontStyles.sgininanotherway),
                              const SizedBox(height: 25),
                              ButtonCustom(
                                textbutton: 'Book Now',
                                colorbutton: Mycolor.lightblue,
                                width: SizeConfig.blockWidth * 40,
                                hieght: SizeConfig.blockHeight * 4.5,
                                textstyel: FontStyles.buy,
                                onpressed: () {
                                  print("Doctor ID: ${doc.id}");
                                  Get.toNamed(
                                    Routes.appointmentScreen,
                                    arguments: {
                                      "id": doc.id,
                                      "address": doc.address,
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Services list from doctor
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Services',
                          style: FontStyles.authtitle.copyWith(
                              fontSize: SizeConfig.blockWidth * 5,
                              color: Mycolor.grey)),
                      const SizedBox(height: 5),
                      ...List.generate(doc.services.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${index + 1}.",
                                  style: FontStyles.authtitle.copyWith(
                                      color: Mycolor.lightblue,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  doc.services[index].toString(),
                                  style: FontStyles.categoriess.copyWith(
                                      color: Mycolor.navyblue,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),

                  const SizedBox(height: 15),
//address
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Text('Doctor Address:',
                        style: FontStyles.authtitle.copyWith(
                            fontSize: SizeConfig.blockWidth * 5.3,
                            color: Mycolor.lightblue)),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Text(doc.address,
                        style: FontStyles.categories.copyWith(
                            fontSize: SizeConfig.blockWidth * 4,
                            color: Mycolor.lightgrey)),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
