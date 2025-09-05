class CreateAmbulanceOrder {
  String ambulance; // 🚑 هون رح يكون الـ ID تبع السيارة
  String address;
  String startHour;
  String endHour;

  CreateAmbulanceOrder({
    required this.ambulance,
    required this.address,
    required this.startHour,
    required this.endHour,
  });

  Map<String, dynamic> toJson() {
    return {
      "ambulance": ambulance,
      "address": address,
      "startHour": startHour,
      "endHour": endHour,
    };
  }
}
