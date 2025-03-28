// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
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
    Get.put(HomeController());
    return Scaffold(
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
          Get.toNamed(Routes.mysaved);
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
                      Text("Ghina", style: FontStyles.rucita),
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
                  child: Image.asset(AppImage.doctor1), // ضع صورتك هنا
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            CustomSearchBar(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Categories(
                      categoryname: 'Doctors',
                      icon: AppImage.topdoctor,
                      onpressed: () {}),
                  SizedBox(
                    width: 18,
                  ),
                  Categories(
                      categoryname: 'Pharmacy',
                      icon: AppImage.pharmacy,
                      onpressed: () {
                        Get.toNamed(Routes.pharmacyScreen);
                      }),
                  SizedBox(
                    width: 18,
                  ),
                  Categories(
                      categoryname: 'Ambulance',
                      icon: AppImage.ambulance,
                      onpressed: () {}),
                  SizedBox(
                    width: 18,
                  ),
                  Categories(
                      categoryname: 'Rays',
                      icon: AppImage.rays,
                      onpressed: () {})
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
            Article(
              articleimage: AppImage.artical1,
              articalcontant: '''The 25 Healthiest Fruits You
Can Eat''',
              articaldate: 'Jun 10, 2023 ',
            ),
            Article(
              articleimage: AppImage.artical2,
              articalcontant: '''The Impact of COVID-19 on
 Healthcare''',
              articaldate: 'Jul 10, 2023',
            ),
            Article(
              articleimage: AppImage.artical4,
              articalcontant: '''Peptide Therapy: The Future
 of Medicine?''',
              articaldate: 'Jul 12, 2023',
            ),
          ],
        ),
      ),
    );
  }
}
