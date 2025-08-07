// widget/contact_doctor_section.dart dart Copy code.dart
import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import '../../media_query_service.dart';
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/text_style.dart';

class ContactDoctorSection extends StatelessWidget {
  const ContactDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: SizeConfig.screenWidth * 0.8, // 90% من عرض الشاشة
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Mycolor.lightgrey.withOpacity(0.4),
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              AppImage.whatsapp, // تأكد من صحة اسم الصورة
              width: SizeConfig.blockWidth * 10,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Book an online consultation',
                style: FontStyles.authtitle.copyWith(
                  fontSize: SizeConfig.blockWidth * 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
