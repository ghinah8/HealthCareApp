import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  late SharedPreferences sharedPreferences;
  String? _username; // تخزين الاسم في الذاكرة

  Future<UserService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    _username = sharedPreferences.getString('username'); // استرجاع الاسم
    return this;
  }

  // حفظ الاسم في الذاكرة أو SharedPreferences
  Future<void> saveUsername(String username,
      {bool saveToPreferences = false}) async {
    _username = username; // تخزين الاسم في الذاكرة
    if (saveToPreferences) {
      await sharedPreferences.setString('username', username);
    }
    print('Username saved: $username');
  }

  // استرجاع الاسم
  Future<String?> getUsername({bool fromPreferences = false}) async {
    if (fromPreferences) {
      return sharedPreferences.getString('username'); // من التخزين
    }
    return _username; // من الذاكرة
  }

  // التحقق من وجود اسم مستخدم مخزن
  Future<bool> isUserRegistered() async {
    return _username != null || sharedPreferences.getString('username') != null;
  }

  // حذف الاسم المخزن
  Future<void> clearUsername() async {
    _username = null; // حذف من الذاكرة
    await sharedPreferences.remove('username'); // حذف من التخزين
    print('Username cleared');
  }
}

// استدعاء الخدمة عند بدء التطبيق
Future<void> initialServices() async {
  await Get.putAsync(() => UserService().init());
}
