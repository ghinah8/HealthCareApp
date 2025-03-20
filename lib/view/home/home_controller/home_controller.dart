import 'package:get/get.dart';

class HomeController extends GetxController {
  var savedArticles =
      <Map<String, String>>[].obs; // List of maps instead of just text

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
