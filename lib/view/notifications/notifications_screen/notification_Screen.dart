// view/notifications/notification_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/notifications/notifications_controller/notifications_controller.dart';
import 'package:healthcare/widget/helpful_widget/notification_list.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/navbar.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Obx(() {
      final isEmpty = controller.isEmpty;

      return Scaffold(
        backgroundColor: Mycolor.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Mycolor.white,
          elevation: 0,
          toolbarHeight: SizeConfig.blockHeight * 12,
          leading: Backbutton(),
          title: Text('Notifications', style: FontStyles.notifications),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavBar(
          isSelectedHome: false,
          isSelectedNotifications: true,
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
        body: isEmpty
            ? Center(
                child: Image.asset(
                  AppImage.notifications,
                  width: SizeConfig.blockWidth * 70,
                  fit: BoxFit.contain,
                ),
              )
            : NotificationListView(notifications: controller.notifications),
      );
    });
  }
}
