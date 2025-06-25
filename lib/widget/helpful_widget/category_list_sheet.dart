// widget/category_list_sheet.dart
import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/media_query_service.dart';

import '../../core/const_data/text_style.dart';

class CategoryListSheet extends StatelessWidget {
  const CategoryListSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final categories = [
      {"title": "Cardiology", "image": "assets/image/cardiology.png.png"},
      {"title": "Neurology", "image": "assets/image/Brain Vector.png"},
      {"title": "Dentistry", "image": "assets/image/dentistry.png.png"},
      {"title": "Endocrinology", "image": "assets/image/Brain Vector.png"},
      {"title": "Oncology", "image": "assets/image/Brain Vector.png"},
      {"title": "Pediatrics", "image": "assets/image/Brain Vector.png"},
      {"title": "Ophthalmology", "image": "assets/image/Brain Vector.png"},
      {"title": "ENT", "image": "assets/image/Brain Vector.png"},
      {"title": "Psychiatry", "image": "assets/image/Brain Vector.png"},
      {"title": "Gynecology", "image": "assets/image/Brain Vector.png"},
      {"title": "Pulmonology", "image": "assets/image/Brain Vector.png"},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockWidth * 4,
        vertical: SizeConfig.blockHeight * 2,
      ),
      height: SizeConfig.screenHeight * 0.8,
      decoration: const BoxDecoration(
        color: Mycolor.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blockHeight * 2),
          Text(
            "All Categories",
            style: FontStyles.title.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SizeConfig.blockHeight * 2),
          Expanded(
            child: ListView.separated(
              itemCount: categories.length,
              separatorBuilder: (_, __) =>
                  SizedBox(height: SizeConfig.blockHeight * 2),
              itemBuilder: (context, index) {
                final category = categories[index];
                return Row(
                  children: [
                    Image.asset(category["image"]!, width: 40, height: 40),
                    SizedBox(width: SizeConfig.blockWidth * 4),
                    Text(
                      category["title"]!,
                      style: FontStyles.searchbarText.copyWith(fontSize: 16),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
