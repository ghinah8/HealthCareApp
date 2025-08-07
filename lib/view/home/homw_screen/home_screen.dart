// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/Article/articleontroller/article_controller.dart';
import 'package:healthcare/view/home/home_controller/home_controller.dart';
import 'package:healthcare/widget/general_widget/navbar.dart';
import 'package:healthcare/widget/helpful_widget/article.dart';
import 'package:healthcare/widget/helpful_widget/categories.dart';
import 'package:healthcare/widget/helpful_widget/custom_searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final homeController = Get.put(HomeController());
    final articalcontroller = Get.put(ArticleController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Click here for help',
        shape: CircleBorder(),
        onPressed: () {
          Get.toNamed(Routes.chatScreen);
        },
        backgroundColor: Mycolor.lightblue,
        child: Image.asset(
          AppImage.aichat,
          width: 30,
          height: 30,
          scale: 0.5,
        ),
      ),
      backgroundColor: Mycolor.white,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 290,
                  decoration: BoxDecoration(
                    color: Mycolor.solightblue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text("welcome !", style: FontStyles.welcome),
                      Obx(() => Text(
                            homeController.username.value,
                            style: FontStyles.rucita,
                          )),
                      SizedBox(height: 5),
                      Text(
                        "How is it going today ?",
                        style: FontStyles.howisitgoingtoday,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 50,
                  child: Image.asset(AppImage.doctor1),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            CustomSearchBar(
              backgroundcolor: Mycolor.grey.withOpacity(0.04),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Categories(
                      categoryname: 'Doctors',
                      icon: AppImage.topdoctor,
                      onpressed: () {
                        Get.toNamed(Routes.finddoctorScreen);
                      }),
                  Categories(
                      categoryname: 'Pharmacy',
                      icon: AppImage.pharmacy,
                      onpressed: () {
                        Get.toNamed(Routes.pharmacyScreen);
                      }),
                  Categories(
                      categoryname: 'Ambulance',
                      icon: AppImage.ambulance,
                      onpressed: () {
                        Get.toNamed(Routes.ambulanceScreen);
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Health article',
                      style: FontStyles.healthyartical,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: FontStyles.seeall,
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              return Column(
                children: articalcontroller.articles.map((article) {
                  return Article(
                      articleimage: article.image,
                      articalcontant: article.content,
                      articaldate: article.date,
                      articletitle: article.title);
                }).toList(),
              );
            })
          ],
        ),
      ),
    );
  }
}
