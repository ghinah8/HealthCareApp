import 'package:get/get.dart';

enum AppointmentFilter { complete, upcoming }

class AllappointmentController extends GetxController {
  var selectedFilter = AppointmentFilter.complete.obs;

  void changeFilter(AppointmentFilter filter) {
    selectedFilter.value = filter;
  }

  // القوائم المفصولة
  final completeAppointments = <String>[].obs;
  final upcomingAppointments = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // مثلاً بيانات وهمية
    completeAppointments.addAll([
      'Dr. Olivia Turner|Dermato-Endocrinology',
      'Dr. Alexander Bennett|Dermato-Genetics',
      'Dr. Sophia Martinez|Cosmetic Bioengineering',
    ]);

    upcomingAppointments.addAll([
      'Dr. Olivia Turner|Dermato-Endocrinology',
      'Dr. Alexander Bennett|Dermato-Genetics',
      'Dr. Sophia Martinez|Cosmetic Bioengineering',
    ]);
  }

  List<String> get currentList {
    switch (selectedFilter.value) {
      case AppointmentFilter.complete:
        return completeAppointments;
      case AppointmentFilter.upcoming:
        return upcomingAppointments;
    }
  }
}
