// view/view/doctor_details_view.dart

import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/helpful_widget/contact_doctor_section.dart';
import 'package:healthcare/widget/helpful_widget/doctor_info_card.dart';
import 'package:healthcare/widget/helpful_widget/services_list.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        leading: Backbutton(),
        title: Text('Doctor Details', // استبدلها بالعنوان المناسب
            style: FontStyles.authtitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 5,
            vertical: SizeConfig.blockHeight * 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Info Card
              const InfoCard(),

              const SizedBox(height: 15),

              const ContactDoctorSection(),

              const SizedBox(height: 15),

              // Services list
              const ServicesList(),

              const SizedBox(height: 15),
              // Doctor Location
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  AppImage.mapp, // تأكد من إضافة صورة الخريطة هنا
                  height: SizeConfig.blockHeight * 25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
