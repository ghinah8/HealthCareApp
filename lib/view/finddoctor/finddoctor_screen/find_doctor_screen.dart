// view/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/finddoctor/finddotor_controller/find_doctor_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/navbar.dart';
import 'package:healthcare/widget/helpful_widget/category_item.dart';
import 'package:healthcare/widget/helpful_widget/custom_searchbar.dart';
import 'package:healthcare/widget/helpful_widget/top_doctor_card.dart';

class FindDoctorScreen extends StatelessWidget {
  FindDoctorScreen({super.key});
  final FindDoctorController controller = Get.put(FindDoctorController());
  final List doctors = [
    {
      'distance': '',
      'name': "Dr. Iona",
      'specialty': "Cardiologist",
      'rating': "4.7",
      'image': "assets/image/Dr. lona.pgn.png",
    },
    {
      'distance': '',
      'name': "Dr. Nallarasi",
      'specialty': "Orthopaedic",
      'rating': "4.7",
      'image': "assets/image/Dr. Nallarasi.pgn.png",
    }
  ];
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
              children: controller.speialty
                  .map(
                    (cat) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockHeight * 1,
                      ),
                      child: CategoryItem(
                        ontap: () {
                          Get.toNamed(
                            Routes.topdoctorScreen,
                            arguments: {'specialty': cat.name},
                          );
                        },
                        title: cat.name,
                        imagePath: "assets/image/cardiology.png.png",
                      ),
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
      body: GetBuilder<FindDoctorController>(
          init: FindDoctorController(),
          builder: (controller) {
            return SafeArea(
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
                      controller.speialty.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox(
                              height: SizeConfig.blockHeight * 12,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  final category = controller.speialty[index];
                                  return CategoryItem(
                                      title: category.name,
                                      imagePath:
                                          "assets/image/cardiology.png.png",
                                      ontap: () {
                                        Get.toNamed(
                                          Routes.topdoctorScreen,
                                          arguments: {
                                            'specialty': category.name
                                          },
                                        );
                                      });
                                },
                              ),
                            ),

                      SizedBox(height: SizeConfig.blockHeight * 2),

                      // العنوان الثاني
                      Text("Doctors", style: FontStyles.doctor),
                      SizedBox(height: SizeConfig.blockHeight * 2),

                      // البطاقات
                      // البطاقات
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          final doctor = doctors[index];
                          return TopDoctorCard(
                            image: doctor['image'] ?? '',
                            name: doctor['name'] ?? '',
                            specialty: doctor['specialty'] ?? '',
                            rating: doctor['rating'] ?? '',
                            distance: doctor['distance'] ?? '',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
