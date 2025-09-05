// widget/category_item.dart
import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/service/link.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback ontap;

  const CategoryItem(
      {super.key,
      required this.title,
      required this.image,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 100,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Mycolor.lightblue, // بدل اللون الأزرق الثابت
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(image),
            Image.network(
              AppLink.fixImageUrl(image),
              height: 35,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 5),
            Container(
              height: 40, // ارتفاع ثابت للنص
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                title,
                style: const TextStyle(color: Colors.white),
                maxLines: 2, // عدد الأسطر المسموح بها
                overflow:
                    TextOverflow.ellipsis, // إضافة ثلاث نقاط عند تجاوز النص
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
