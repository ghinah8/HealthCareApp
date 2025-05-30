import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/view/Article/article-screen/articlescreen.dart';
import 'package:healthcare/view/home/home_controller/home_controller.dart';

class Article extends StatelessWidget {
  const Article({
    required this.articleimage,
    required this.articalcontant,
    required this.articaldate,
    required this.articletitle,
  });

  final String articleimage;
  final String articalcontant;
  final String articaldate;
  final String articletitle;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Obx(() {
      bool isSaved = homeController.isArticleSaved(articletitle);

      return GestureDetector(
        onTap: () {
          Get.to(() => ArticleScreen(
                articleimage: articleimage,
                articalcontant: articalcontant,
                articaldate: articaldate,
                articletitle: articletitle,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            height: 95,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Mycolor.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 7, right: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(articleimage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 9),
                      Text(
                        articletitle,
                        style: FontStyles.articalcontant,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6),
                      Text(
                        articaldate,
                        style: FontStyles.articaltime,
                      ),
                    ],
                  ),
                  SizedBox(width: 12),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        homeController.toggleSaveArticle(articalcontant,
                            articleimage, articaldate, articletitle);
                      },
                      icon: Icon(
                        isSaved
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        size: 25,
                        color: Mycolor.lightblue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
