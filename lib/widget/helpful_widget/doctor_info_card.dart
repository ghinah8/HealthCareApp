// widget/doctor_info_card.dart

import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/widget/helpful_widget/consultation_button.dart';
import '../../media_query_service.dart';
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/text_style.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({super.key});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
      decoration: BoxDecoration(
        color: Mycolor.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Mycolor.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImage.doctorimage,
              width: SizeConfig.blockWidth * 25,
              height: SizeConfig.blockWidth * 25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: SizeConfig.blockWidth * 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Dr. Rishi',
                        style: FontStyles.authtitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Specialist Cardiologist ',
                  style: FontStyles.haveanaccount,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: index < 4
                              ? Colors.amber
                              : Mycolor.lightgrey.withOpacity(0.5),
                          size: 20,
                        );
                      }),
                    ),

                    // Price
                    Row(
                      children: [
                        const SizedBox(width: 4),
                        Text(
                          '\$',
                          style: FontStyles.haveanaccount.copyWith(
                            color: Mycolor.lightblue,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                SizeConfig.blockWidth * 4.5, // 👈 تكبير الحجم
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '28.00',
                          style: FontStyles.haveanaccount.copyWith(
                            color: Mycolor.lightgrey,
                            fontWeight: FontWeight.normal,
                            fontSize:
                                SizeConfig.blockWidth * 4.5, // 👈 تكبير الحجم
                          ),
                        ),
                        Text(
                          '/hr',
                          style: FontStyles.haveanaccount.copyWith(
                            color: Mycolor.lightgrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const ConsultationButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
