import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/view/home/home_controller/home_controller.dart';
import 'package:healthcare/widget/helpful_widget/article.dart';

class MysavedScreen extends StatelessWidget {
  const MysavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Get.put(HomeController());
    final HomeController homeController = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Text(
            'My Saved',
            style: FontStyles.welcome,
          ),
        ),
        leading: BackButton(),
        toolbarHeight: 80,
      ),
      body: Obx(() {
        if (homeController.savedArticles.isEmpty) {
          return Center(
            child: Text(
              'No saved articles',
              style: FontStyles.articalcontant,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: homeController.savedArticles.length,
            itemBuilder: (context, index) {
              var savedArticle = homeController.savedArticles[index];

              return Article(
                articleimage: savedArticle['image']!,
                articalcontant: savedArticle['content']!,
                articaldate: savedArticle['date']!,
              );
            },
          ),
        );
      }),
    );
  }
}
