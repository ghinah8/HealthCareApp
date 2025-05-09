import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/widget/general_widget/navbar.dart';
import 'package:healthcare/widget/helpful_widget/Generalreport.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Mycolor.white,
      bottomNavigationBar: BottomNavBar(
        isSelectedHome: false,
        isSelectedNotifications: false,
        isSelectedProfile: false,
        isSelectedReports: true,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Mycolor.lightblue.withAlpha(47),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Column(
                            children: [
                              Text(
                                'Heart Rate',
                                style: FontStyles.heartrate,
                              ),
                              Text(
                                '80 bpm',
                                style: FontStyles.heatpbm,
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          AppImage.heartbeat,
                          width: 200,
                          height: 200,
                          scale: 1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.43,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Mycolor.container1color.withAlpha(47),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImage.blooddrop),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Blood Group',
                          style: FontStyles.heartrate,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'A+',
                          style: FontStyles.heatpbm,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.width * 0.43,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Mycolor.container2color,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImage.weightlifting),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Weight',
                          style: FontStyles.heartrate,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '103lbs',
                          style: FontStyles.heatpbm,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Latest Report',
                style: FontStyles.latestreport,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Generalreport(
                title: 'General report',
                date: 'Jul 10,2023',
                onpressed: () {
                  Get.toNamed(Routes.radiologyresult);
                },
                moreonpressed: () {}),
            Generalreport(
                title: 'MRI Scan-Brain ',
                date: 'May 1,2025',
                onpressed: () {
                  Get.toNamed(Routes.radiologyresult);
                },
                moreonpressed: () {})
          ],
        ),
      ),
    );
  }
}
