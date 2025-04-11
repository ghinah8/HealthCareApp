import 'package:get/get.dart';
import 'package:healthcare/service/my_sevice.dart';

class HomeController extends GetxController {
  var savedArticles =
      <Map<String, String>>[].obs; // List of maps instead of just text
  var username = ''.obs; // حفظ اسم المستخدم ليظهر في الواجهة

  @override
  void onInit() {
    super.onInit();
    loadUsername(); // تحميل الاسم عند فتح الصفحة
  }

  // تحميل اسم المستخدم المخزن في `UserService`
  Future<void> loadUsername() async {
    final userService = Get.find<UserService>();
    String? storedUsername =
        await userService.getUsername(fromPreferences: true);
    username.value =
        storedUsername ?? 'Guest'; // تعيين قيمة افتراضية إذا لم يوجد اسم
  }

  // Function to Save/Remove an Article
  void toggleSaveArticle(String content, String image, String date) {
    var article = {
      'content': content,
      'image': image,
      'date': date,
    };

    // Check if article already exists
    bool exists = savedArticles.any((a) => a['content'] == content);

    if (exists) {
      savedArticles.removeWhere((a) => a['content'] == content); // Remove it
    } else {
      savedArticles.add(article); // Save it
    }
    update();
  }

  // Check if an article is saved
  bool isArticleSaved(String content) {
    return savedArticles.any((a) => a['content'] == content);
  }
}
