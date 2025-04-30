import 'package:get/get.dart';

class AppointmentController extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  String? selectedTime;

  void selectTime(String time) {
    selectedTime = time;
    update(); // حتى تتحدث الواجهة
  }

  // خريطة المواعيد حسب التاريخ
  Map<DateTime, List<String>> availableTimesPerDay = {
    DateTime(2025, 4, 30): ['10:00 AM', '12:00 PM'],
    DateTime(2025, 5, 1): ['2:00 PM', '4:00 PM', '6:00 PM'],
    DateTime(2025, 5, 2): [
      '10:00 AM',
      '12:00 PM',
      '2:00 PM',
      '4:00 PM',
      '6:00 PM',
    ],
    // أضف المزيد حسب الحاجة
  };

  List<String> get selectedDayTimes {
    final day = selectedDay ?? focusedDay;
    return availableTimesPerDay[DateTime(day.year, day.month, day.day)] ?? [];
  }

  bool isSelected(DateTime day) {
    return selectedDay != null &&
        day.year == selectedDay!.year &&
        day.month == selectedDay!.month &&
        day.day == selectedDay!.day;
  }

  void removetime(String timeToRemove) {
    final day = selectedDay ?? focusedDay;
    final key = DateTime(day.year, day.month, day.day);

    final times = availableTimesPerDay[key];
    if (times != null) {
      times.remove(timeToRemove); // حذف الوقت
      if (times.isEmpty) {
        availableTimesPerDay.remove(key); // احذف اليوم إذا ما ضل فيه ولا وقت
      } else {
        availableTimesPerDay[key] = times; // حدّث القائمة
      }
    }

    selectedTime = null; // لإزالة التحديد
    update();
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay = selected;
    focusedDay = focused;
    update(); // لتحديث الواجهة
  }
}
