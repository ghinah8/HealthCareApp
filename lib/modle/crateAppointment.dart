class CreateAppointment {
  String doctor;
  String address;
  String startHour;
  String endHour;

  CreateAppointment({
    required this.doctor,
    required this.address,
    required this.startHour,
    required this.endHour,
  });

  Map<String, dynamic> toJson() {
    return {
      "doctor": doctor,
      "address": address,
      "startHour": startHour,
      "endHour": endHour,
    };
  }
}
