// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/Appointment/Appointment_controller/Appointment_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/availabletime.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text(
              'Appointment',
              style: FontStyles.pharmacy,
            ),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
      body: GetBuilder<AppointmentController>(
        init: AppointmentController(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              TableCalendar(
                daysOfWeekHeight: 20,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: FontStyles.weekday,
                  weekendStyle: FontStyles.weekendday,
                ),
                rowHeight: 60,
                headerStyle: HeaderStyle(
                  leftChevronIcon:
                      Icon(Icons.chevron_left, color: Mycolor.white),
                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: Mycolor.white),
                  titleTextStyle: FontStyles.buy,
                  formatButtonVisible: false,
                  titleCentered: true,
                  decoration: BoxDecoration(
                    color: Mycolor.lightblue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
                focusedDay: controller.focusedDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                selectedDayPredicate: controller.isSelected,
                onDaySelected: controller.onDaySelected,
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Mycolor.lightgrey.withAlpha(150),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Mycolor.lightblue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available Time',
                  style: FontStyles.availabletime,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.selectedDayTimes.length,
                    itemBuilder: (context, index) {
                      final time = controller.selectedDayTimes[index];
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Availabletime(
                            time: time,
                            isSelected: time == controller.selectedTime,
                            onTap: () => controller.selectTime(time),
                          ));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: ButtonCustom(
                    textbutton: 'Book Appointment',
                    colorbutton: Mycolor.lightblue,
                    hieght: 60,
                    width: double.infinity,
                    textstyel: FontStyles.buy,
                    onpressed: controller.selectedTime == null
                        ? null
                        : () {
                            final selectedDate =
                                controller.selectedDay ?? controller.focusedDay;

                            // استخراج اليوم والشهر والسنة
                            final day =
                                selectedDate.day.toString().padLeft(2, '0');
                            final month =
                                selectedDate.month.toString().padLeft(2, '0');
                            final year = selectedDate.year;

                            final formattedDate = '$year-$month-$day';

                            Get.snackbar(
                              'Booking Appointment At',
                              '${controller.selectedTime} on $formattedDate',
                              backgroundColor: Mycolor.bublechatrecivecolor,
                              colorText: Mycolor.black,
                            );
                            controller.removetime(controller.selectedTime!);
                            Get.toNamed(Routes.cardinfoscreen);
                          }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
