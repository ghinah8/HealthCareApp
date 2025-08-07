import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/allappointment/allapointment_controller/allappointment_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/navbar.dart';
import 'package:healthcare/widget/helpful_widget/allappointment.dart';
import 'package:healthcare/widget/helpful_widget/upcomingandcomplete.dart';

class AllappointmentScreen extends StatelessWidget {
  const AllappointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Get.put(AllappointmentController());
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Mycolor.white,
        elevation: 0,
        toolbarHeight: SizeConfig.blockHeight * 12,
        leading: Backbutton(),
        title: Text('All Appointment', style: FontStyles.notifications),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavBar(
        isSelectedHome: false,
        isSelectedNotifications: false,
        isSelectedProfile: true,
        isSelectedReports: false,
        onPressedHome: () => Get.toNamed(Routes.homescreen),
        onPressedProfile: () => Get.toNamed(Routes.profilescreen),
        onPressedReports: () => Get.toNamed(Routes.reportesScreen),
        onPressedNotifications: () => Get.toNamed(Routes.notificationsScreen),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Upcomingandcomplete(
                    text: 'Complete', filter: AppointmentFilter.complete),
                Upcomingandcomplete(
                    text: 'UpComming', filter: AppointmentFilter.upcoming),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() {
              final controller = Get.find<AllappointmentController>();
              final filter = controller.selectedFilter.value;
              final list = controller.currentList;

              return Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final data = list[index].split('|');
                    return AppointmentCard(
                      doctorName: data[0],
                      specialization: data[1],
                      filter: filter,
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
