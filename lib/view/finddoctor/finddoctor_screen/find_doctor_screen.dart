// view/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/Doctor-details/doctordetail_Screen/doctor_details_view.dart';
import 'package:healthcare/view/finddoctor/finddotor_controller/find_doctor_controller.dart';
import 'package:healthcare/view/top_doctor/topdoctor_controller/topdoctor_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/navbar.dart';
import 'package:healthcare/widget/helpful_widget/category_item.dart';
import 'package:healthcare/widget/helpful_widget/custom_searchbar.dart';
import 'package:healthcare/widget/helpful_widget/top_doctor_card.dart';

class FindDoctorScreen extends StatelessWidget {
  FindDoctorScreen({super.key});
  final FindDoctorController controller = Get.put(FindDoctorController());
  final TopDoctorsController doctorsController =
      Get.put(TopDoctorsController());
  void _showAllCategories(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Mycolor.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Obx(() {
          return Padding(
            padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
            child: ListView(
              children: controller.specifics
                  .map(
                    (cat) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockHeight * 1,
                      ),
                      child: CategoryItem(
                          ontap: () {
                            Get.toNamed(
                              Routes.topdoctorScreen,
                              arguments: {
                                'specialtyId': cat.id,
                                'specialtyName': cat.name,
                              },
                            );
                          },
                          title: cat.name,
                          image: cat.image!),
                    ),
                  )
                  .toList(),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        bottomNavigationBar: BottomNavBar(
          isSelectedHome: true,
          isSelectedNotifications: false,
          isSelectedProfile: false,
          isSelectedReports: false,
          onPressedHome: () {
            Get.toNamed(Routes.homescreen);
          },
          onPressedProfile: () {
            Get.toNamed(Routes.profilescreen);
          },
          onPressedReports: () {
            Get.toNamed(Routes.reportesScreen);
          },
          onPressedNotifications: () {
            Get.toNamed(Routes.notificationsScreen);
          },
        ),
        appBar: AppBar(
          leading: Backbutton(),
          toolbarHeight: 100,
          backgroundColor: Mycolor.white,
          title: // العنوان
              Text.rich(
            TextSpan(
              text: "Find ",
              style: FontStyles.findyour,
              children: [
                TextSpan(
                  text: "your doctor",
                  style: FontStyles.findyourdoctor,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Mycolor.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // مربع البحث
                  CustomSearchBar(
                      backgroundcolor: Mycolor.lightgrey.withAlpha(20)),
                  SizedBox(height: SizeConfig.blockHeight * 2),

                  // الفئات
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories", style: FontStyles.categories),
                      TextButton(
                        onPressed: () => _showAllCategories(context),
                        child: Text("see all", style: FontStyles.seeall),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockHeight),

                  // Scroll أفقي للفئات
                  // inside UI
                  Obx(() {
                    if (controller.isloading.value) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return SizedBox(
                      height: SizeConfig.blockHeight * 12,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.specifics.length,
                        itemBuilder: (context, index) {
                          final category = controller.specifics[index];
                          return CategoryItem(
                            title: category.name,
                            image: category.image!,
                            ontap: () {
                              Get.toNamed(
                                Routes.topdoctorScreen,
                                arguments: {
                                  'specialtyId':
                                      category.id, // ← هاد هو يلي بيعمل الفلترة
                                  'specialtyName': category.name,
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  }),

                  SizedBox(height: SizeConfig.blockHeight * 2),

                  // العنوان الثاني
                  Text("Doctors", style: FontStyles.doctor),
                  SizedBox(height: SizeConfig.blockHeight * 2),

                  // البطاقات
                  GetBuilder(
                      init: TopDoctorsController(),
                      builder: (doctorcontroller) {
                        if (doctorcontroller.isLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: doctorsController.allDoctors.length,
                          itemBuilder: (context, index) {
                            final doctor = doctorsController.allDoctors[index];

                            return FutureBuilder<String>(
                              future: Get.find<FindDoctorController>()
                                  .fetchSpecificNameById(doctor.specific),
                              builder: (context, snapshot) {
                                final specialtyName =
                                    snapshot.data ?? "Unknown";

                                return TopDoctorCard(
                                  ontap: () {
                                    Get.to(() =>
                                        DoctorDetailsView(doctorId: doctor.id));
                                  },
                                  image: doctor.image ?? '',
                                  name: doctor.username,
                                  specialty: specialtyName,
                                  location: doctor.address ?? "Aleppo",
                                );
                              },
                            );
                          },
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
