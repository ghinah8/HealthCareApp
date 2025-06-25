// widget/category_item.dart
import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback ontap;

  const CategoryItem(
      {super.key,
      required this.title,
      required this.imagePath,
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
            Image.asset(imagePath, height: 50),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
