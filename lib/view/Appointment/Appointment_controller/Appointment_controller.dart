import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/modle/crateAppointment.dart';
import 'package:healthcare/service/link.dart';
import 'package:http/http.dart' as http;

class AppointmentController extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  String? selectedTime;
  RxBool isLoading = true.obs;
  // مدة كل موعد بالدقائق
  final int slotMinutes = 30;

  // بداية ونهاية يوم العمل
  final int startHour = 10;
  final int endHour = 19; // 7 مساءً

  // المواعيد المتوفرة لكل يوم
  Map<DateTime, List<String>> availableTimesPerDay = {};

  @override
  void onInit() {
    super.onInit();
    _generateMonthAppointments();
  }

  /// توليد المواعيد من اليوم الحالي لشهر لقدام
  void _generateMonthAppointments() {
    final today = DateTime.now();

    for (int i = 0; i < 30; i++) {
      final day = DateTime(today.year, today.month, today.day + i);
      availableTimesPerDay[day] = _generateDailySlots();
    }
  }

  /// توليد أوقات اليوم بنص ساعة لكل موعد
  List<String> _generateDailySlots() {
    List<String> slots = [];
    for (int hour = startHour; hour <= endHour; hour++) {
      for (int minute = 0; minute < 60; minute += slotMinutes) {
        if (hour == endHour && minute > 0) break; // لا تتجاوز الساعة الأخيرة
        final time = TimeOfDay(hour: hour, minute: minute);
        slots.add(_formatTimeOfDay(time));
      }
    }
    return slots;
  }

  /// تحويل TimeOfDay إلى نص AM/PM
  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  /// إرجاع المواعيد لليوم المحدد
  List<String> get selectedDayTimes {
    final day = selectedDay ?? focusedDay;
    return availableTimesPerDay[DateTime(day.year, day.month, day.day)] ?? [];
  }

  /// حجز موعد (إزالته من المتاح)
  void bookTime(String timeToBook) {
    final day = selectedDay ?? focusedDay;
    final key = DateTime(day.year, day.month, day.day);

    final times = availableTimesPerDay[key];
    if (times != null) {
      times.remove(timeToBook);
      if (times.isEmpty) {
        availableTimesPerDay.remove(key);
      }
    }

    selectedTime = null; // إلغاء التحديد بعد الحجز
    update();
  }

  /// تحديد اليوم
  void onDaySelected(DateTime selected, DateTime focused) {
    if (selected.isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
      return;
    }
    selectedDay = selected;
    focusedDay = focused;
    update();
  }

  /// التحقق إذا اليوم هو اليوم المحدد
  bool isSelected(DateTime day) {
    return selectedDay != null &&
        day.year == selectedDay!.year &&
        day.month == selectedDay!.month &&
        day.day == selectedDay!.day;
  }

  /// تحديد الوقت المختار مؤقتاً
  void selectTime(String time) {
    selectedTime = time;
    update();
  }

  Future<void> createAppointment(CreateAppointment order) async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(AppLink.createOrder),
        headers: {
          "Content-Type": "application/json",
          ...AppLink.getHeader(),
        },
        body: jsonEncode(order.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        Get.snackbar("Error", "Failed: ${response.statusCode} ");
        print(response.body);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void bookAndSendAppointment(String doctorId, String address) {
    if (selectedTime == null) return;

    final start = selectedTime!;
    // حساب النهاية: نص ساعة بعد البداية
    final timeParts = start.split(RegExp(r'[: ]')); // ['10','30','AM']
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    final period = timeParts[2];

    if (period == 'PM' && hour != 12) hour += 12;
    if (period == 'AM' && hour == 12) hour = 0;

    final day = selectedDay ?? focusedDay; // 👈 حل مشكلة الـ null
    final startDateTime = DateTime(day.year, day.month, day.day, hour, minute);
    final endDateTime = startDateTime.add(Duration(minutes: slotMinutes));

    final startFormatted =
        '${startDateTime.hour.toString().padLeft(2, '0')}:${startDateTime.minute.toString().padLeft(2, '0')}';
    final endFormatted =
        '${endDateTime.hour.toString().padLeft(2, '0')}:${endDateTime.minute.toString().padLeft(2, '0')}';

    final appointment = CreateAppointment(
      doctor: doctorId,
      address: address,
      startHour: startFormatted,
      endHour: endFormatted,
    );

    createAppointment(appointment);
    bookTime(start); // إزالة الوقت من القائمة بعد الحجز
  }
}
