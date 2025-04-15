class PatientModel {
  String? name; // تغيير إلى nullable
  String? age;
  String? gender; // nullable
  String? mobileNumber;
  String? email;
  int currentStep = 1;

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "gender": gender,
      "mobileNumber": mobileNumber,
      "email": email,
    };
  }
}
