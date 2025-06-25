import 'package:get/get.dart';

class TopDoctorsController extends GetxController {
  String selectedSpecialty = '';

  final List<Map<String, String>> allDoctors = [
    {
      'image': "assets/image/Dr. Rishi.png",
      'name': "Dr. Rishi",
      'specialty': "Cardiology",
      'rating': "4.7",
      'distance': "600m away",
    },
    {
      'image': "assets/image/Dr. Vaamana.png",
      'name': "Dr. Vaamana",
      'specialty': "Dentistry",
      'rating': "4.7",
      'distance': "600m away",
    },
    {
      'image': "assets/image/Dr. Nallarasi.png",
      'name': "Dr. Nallarasi",
      'specialty': "Orthopaedic",
      'rating': "4.7",
      'distance': "300m away",
    },
    {
      'image': "assets/image/Dr. Nihal.png",
      'name': "Dr. Nihal",
      'specialty': "Cardiology",
      'rating': "4.7",
      'distance': "800m away",
    },
    {
      'image': "assets/image/Dr. Rishita.png",
      'name': "Dr. Rishita",
      'specialty': "Cardiology",
      'rating': "4.7",
      'distance': "800m away",
    }
  ];

  List<Map<String, String>> filteredDoctors = [];

  void filterDoctorsBySpecialty(String specialty) {
    selectedSpecialty = specialty;
    filteredDoctors =
        allDoctors.where((doc) => doc['specialty'] == specialty).toList();
    update();
  }
}
