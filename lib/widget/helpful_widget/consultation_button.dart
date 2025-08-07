// widget/consultation_button.dart
import 'package:flutter/material.dart';
import '../../media_query_service.dart';
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/text_style.dart';

class ConsultationButton extends StatelessWidget {
  const ConsultationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          SizeConfig.blockWidth * 40, // 👈 أصغر عرض، تقريبًا 40% من عرض الشاشة

      height: SizeConfig.blockHeight * 4.5,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Mycolor.lightblue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text("Book Now", style: FontStyles.loginbutton),
      ),
    );
  }
}
