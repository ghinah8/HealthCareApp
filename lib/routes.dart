import 'package:get/get.dart';
import 'package:healthcare/view/Ambulance/Ambulance_Screen/Ambulance_Screen.dart';
import 'package:healthcare/view/Appointment/Appointment_Screen/Appointment_Screen.dart';
import 'package:healthcare/view/RadiologyResult/radiology_screen/radiology_screen.dart';
import 'package:healthcare/view/Reportes/report_screen/report_screen.dart';
import 'package:healthcare/view/auth/sginin/sginin.dart';
import 'package:healthcare/view/auth/sginup/sginup_screen.dart';
import 'package:healthcare/view/card_info/cardinfo_screen/cardinfo_screen.dart';
import 'package:healthcare/view/cart/cart_screen/cart_screen.dart';
import 'package:healthcare/view/chat/chat_screen/chat_screen.dart';
import 'package:healthcare/view/eligibility/eligilbility_screen/eligibility_screen.dart';
import 'package:healthcare/view/finddoctor/finddoctor_screen/find_doctor_screen.dart';
import 'package:healthcare/view/home/homw_screen/home_screen.dart';
import 'package:healthcare/view/mysaved/mysaved_screen/mysaved_screen.dart';
import 'package:healthcare/view/patientdetail/patientdetail_Screen/patient_details_screen.dart';
import 'package:healthcare/view/pharmacy/pharmcy_screen/pharmacy_screen.dart';
import 'package:healthcare/view/pharmacy/pharmcy_screen/seeallproduct.dart';
import 'package:healthcare/view/profile/profile_screen/profile_screen.dart';
import 'package:healthcare/view/splash_screen/letsstarted.dart';
import 'package:healthcare/view/splash_screen/secondscreen.dart';
import 'package:healthcare/view/splash_screen/splashanimated.dart';
import 'package:healthcare/view/splash_screen/thirdscreen.dart';
import 'package:healthcare/view/top_doctor/topdoctor_screen/topdoctor_screen.dart';

class Routes {
  static const String signupscreen = '/sign_up_screen';
  static const String loginscreen = '/log_in_screen';
  static const String homescreen = '/home_screen';
  static const String profilescreen = '/profile_screen';
  static const String animatedsplash = '/splashanimated';
  static const String secondsplashscreen = '/secondsplash';
  static const String thirdsplashscreen = '/thirdsplash';
  static const String mysaved = '/mysaved';
  static const String pharmacyScreen = '/pharmacy';
  static const String patientdetailScreen = '/patientdetailScreen';
  static const String eligilbilityScreen = '/eligilbilityscreen';
  static const String letstarted = '/letstarted';
  static const String medicinedetailsScreen = '/medicinedetails';
  static const String cartScreen = '/cartscreen';
  static const String cardinfoscreen = '/cardinfoscreen';
  static const String ambulanceScreen = '/AmbulanceScreen';
  static const String appointmentScreen = '/appointmentscreen';
  static const String reportesScreen = '/reportscreen';
  static const String radiologyresult = '/radiologyresult';
  static const String seeallmedicine = '/seeallmedicine';
  static const String articlscreen = '/articlescreen';
  static const String topdoctorScreen = '/topdoctorscreen';
  static const String finddoctorScreen = '/finddoctorscreen';
  static const String chatScreen = '/chatscreen';
  static final List<GetPage> pages = [
    GetPage(name: '/home_screen', page: () => HomeScreen()),
    GetPage(name: '/sign_up_screen', page: () => SignupScreen()),
    GetPage(name: '/log_in_screen', page: () => LoginScreen()),
    GetPage(name: '/profile_screen', page: () => const ProfileScreen()),
    GetPage(name: '/splashanimated', page: () => SplashScreen()),
    GetPage(name: '/secondsplash', page: () => secondscreen()),
    GetPage(name: '/thirdsplash', page: () => thirdscreen()),
    GetPage(name: '/mysaved', page: () => MysavedScreen()),
    GetPage(name: '/pharmacy', page: () => PharmacyScreen()),
    GetPage(name: '/patientdetailScreen', page: () => PatientDetailsScreen()),
    GetPage(name: '/eligilbilityscreen', page: () => EligibilityScreen()),
    GetPage(name: '/letstarted', page: () => LetstartedScreen()),
    GetPage(name: '/cartscreen', page: () => CartScreen()),
    GetPage(name: '/cardinfoscreen', page: () => CardinfoScreen()),
    GetPage(name: '/AmbulanceScreen', page: () => AmbulanceScreen()),
    GetPage(name: '/appointmentscreen', page: () => AppointmentScreen()),
    GetPage(name: '/reportscreen', page: () => ReportScreen()),
    GetPage(name: '/radiologyresult', page: () => RadiologyScreen()),
    GetPage(name: '/seeallmedicine', page: () => Seeallproduct()),
    GetPage(name: '/topdoctorscreen', page: () => TopDoctorsView()),
    GetPage(name: '/finddoctorscreen', page: () => FindDoctorScreen()),
    GetPage(name: '/chatscreen', page: () => ChatScreen())
  ];
}
