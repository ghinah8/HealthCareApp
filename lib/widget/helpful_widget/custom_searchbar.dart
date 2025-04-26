import 'package:flutter/material.dart';

import '../../core/const_data/app_colors.dart';
import '../../core/const_data/text_style.dart';
import '../../media_query_service.dart';

class CustomSearchBar extends StatelessWidget {
  final Widget? netxPage; // خاصية اختيارية لقبول الدالة
  final Color backgroundcolor;
  const CustomSearchBar({
    super.key,
    this.netxPage,
    required this.backgroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    // تهيئة SizeConfig
    SizeConfig().init(context);

    return InkWell(
      child: Container(
        height: SizeConfig.heightPercentage(6), // الديناميكية في الارتفاع
        width:
            SizeConfig.widthPercentage(92), // عرض الحقل ديناميكي (مناسب للشاشة)
        child: TextField(
          onTap: () {
            // Get.to(
            //   netxPage,
            //   transition: Transition.fade,
            //   duration: const Duration(milliseconds: 300),
            // );
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: backgroundcolor,
            hintText: 'Search',
            hintStyle: FontStyles.searchbarText.copyWith(),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 3, left: 6),
              child: Icon(
                Icons.search_outlined,
                color: Mycolor.lightgrey,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: SizeConfig.heightPercentage(1.5),
              horizontal: SizeConfig.widthPercentage(3),
            ), // مسافات ديناميكية داخل الحقل
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  SizeConfig.widthPercentage(6)), // نصف القطر ديناميكي
              borderSide: BorderSide(
                color: Colors.transparent, // جعل الحدود بلون كاشف (شفاف)
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  SizeConfig.widthPercentage(6)), // نصف القطر ديناميكي
              borderSide: BorderSide(
                color: Colors.transparent, // جعل الحدود بلون كاشف (شفاف)
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  SizeConfig.widthPercentage(6)), // نصف القطر ديناميكي
              borderSide: BorderSide(
                color: Colors.transparent, // جعل الحدود بلون كاشف (شفاف)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
