import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/profile/profile_controller/profile_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/navbar.dart';
import 'package:healthcare/widget/helpful_widget/profiledetails.dart';
import 'package:healthcare/widget/helpful_widget/unsedwidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        isSelectedHome: false,
        isSelectedNotifications: false,
        isSelectedProfile: true,
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
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        leading: Backbutton(),
      ),
      body: GetBuilder(
          init: ProfileController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        minRadius: 7,
                        maxRadius: 70,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: controller.image.value.path == ''
                              ? Image.asset(
                                  AppImage.profilepicture,
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  controller.image.value,
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        left: 95,
                        bottom: -7,
                        child: IconButton(
                            onPressed: () {
                              controller.imagePicker();
                            },
                            icon: Icon(
                              Icons.add_a_photo,
                              size: 36,
                              color: Mycolor.lightblue,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => Text(
                        controller.username.value,
                        style: FontStyles.profilename,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Unsedwidget(
                          image: AppImage.heartrat,
                          name: 'Heart rate',
                          namenumber: '215bpm'),
                      SizedBox(
                        height: 55,
                        child: VerticalDivider(
                          thickness: 2,
                          width: 4,
                          indent: 0,
                          color: Mycolor.messagetextcolor.withAlpha(25),
                        ),
                      ),
                      Unsedwidget(
                          image: AppImage.calories,
                          name: 'Calories',
                          namenumber: "1300"),
                      SizedBox(
                        height: 55,
                        child: VerticalDivider(
                          thickness: 2,
                          width: 4,
                          indent: 0,
                          color: Mycolor.messagetextcolor.withAlpha(25),
                        ),
                      ),
                      Unsedwidget(
                          image: AppImage.wieght,
                          name: 'Weight',
                          namenumber: '190 Lbs')
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Profiledetails(
                      iconimage: AppImage.heartprofile,
                      text: 'My Saved',
                      goto: () {
                        Get.toNamed(Routes.mysaved);
                      },
                      padding: 146),
                  SizedBox(
                    height: 15,
                    child: Divider(
                      thickness: 2,
                      indent: 0,
                      color: Mycolor.messagetextcolor.withAlpha(20),
                    ),
                  ),
                  Profiledetails(
                    iconimage: AppImage.document,
                    text: 'Appointmnet',
                    goto: () {
                      Get.toNamed(Routes.allappointment);
                    },
                    padding: 116,
                  ),
                  SizedBox(
                    height: 15,
                    child: Divider(
                      thickness: 2,
                      indent: 0,
                      color: Mycolor.messagetextcolor.withAlpha(20),
                    ),
                  ),
                  Profiledetails(
                    iconimage: AppImage.wallet,
                    text: "Payment Method",
                    goto: () {},
                    padding: 83,
                  ),
                  SizedBox(
                    height: 15,
                    child: Divider(
                      thickness: 2,
                      indent: 0,
                      color: Mycolor.messagetextcolor.withAlpha(20),
                    ),
                  ),
                  Profiledetails(
                      iconimage: AppImage.chat,
                      text: 'FAQs',
                      goto: () {},
                      padding: 185),
                  SizedBox(
                    height: 15,
                    child: Divider(
                      thickness: 2,
                      indent: 0,
                      color: Mycolor.messagetextcolor.withAlpha(20),
                    ),
                  ),
                  Profiledetails(
                      iconimage: AppImage.exit,
                      text: 'Log Out',
                      goto: () {
                        Get.toNamed(Routes.loginscreen);
                      },
                      padding: 164)
                ],
              ),
            );
          }),
    );
  }
}
