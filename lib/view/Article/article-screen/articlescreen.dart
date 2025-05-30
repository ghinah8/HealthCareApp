import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';

class ArticleScreen extends StatelessWidget {
  final String articleimage;
  final String articalcontant;
  final String articaldate;
  final String articletitle;

  const ArticleScreen({
    super.key,
    required this.articleimage,
    required this.articalcontant,
    required this.articaldate,
    required this.articletitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        title: Text(articletitle, style: FontStyles.healthyartical),
        centerTitle: true,
        backgroundColor: Mycolor.white,
        toolbarHeight: 100,
        leading: Backbutton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height *
                      0.2, // جعل الصورة أكبر لكن ليست ضخمة
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      articleimage,
                      fit: BoxFit
                          .cover, // أو جرب BoxFit.contain إذا كنت تريد الحفاظ على أبعاد الصورة
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(articaldate, style: FontStyles.articaltime)),
                const SizedBox(height: 10),
                Text(
                  articalcontant,
                  style: FontStyles.articalcontant,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
