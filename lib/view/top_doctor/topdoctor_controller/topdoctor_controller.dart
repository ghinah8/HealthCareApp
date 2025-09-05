import 'package:get/get.dart';
import 'package:healthcare/modle/getDoctor-model.dart';
import 'package:healthcare/service/link.dart';
import 'package:http/http.dart' as http;

class TopDoctorsController extends GetxController {
  List<User> allDoctors = [];
  List<User> filteredDoctors = [];
  Map<String, String> specialtyNames = {}; // لتخزين اسم الاختصاص لكل id
  bool isLoading = false;
  String selectedSpecialty = ''; // الاسم للعرض
  String selectedSpecialtyId = ''; // ال id للمقارنة

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    try {
      isLoading = true;
      update();

      final response = await http.get(
        Uri.parse(AppLink.doctors),
        headers: AppLink.getHeader(),
      );

      if (response.statusCode == 200) {
        final data = getDoctorFromJson(response.body);
        allDoctors = data.users;

        // إذا اخترنا اختصاص مسبقًا
        if (selectedSpecialty.isNotEmpty && selectedSpecialtyId.isNotEmpty) {
          filterDoctorsBySpecialty(selectedSpecialtyId, selectedSpecialty);
        } else {
          filteredDoctors = allDoctors;
        }
      } else {
        Get.snackbar('NO Internet connection',
            'Please try again after you get an internet connection');
      }
    } catch (e) {
      Get.snackbar("Exception: $e", '$e');
    } finally {
      isLoading = false;
      update();
    }
  }

  void filterDoctorsBySpecialty(String specialtyId, String specialtyName) {
    selectedSpecialty = specialtyName; // للعرض فقط
    filteredDoctors = allDoctors
        .where((doc) => doc.specific == specialtyId) // مقارنة مباشرة بالـ id
        .toList();
    update();
  }
}
