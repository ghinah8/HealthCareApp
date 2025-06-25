// widget/top_doctor_card.dart
import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';

class TopDoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String specialty;
  final String rating;
  final String distance;

  const TopDoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 2),
      padding: EdgeInsets.all(SizeConfig.blockWidth * 3),
      decoration: BoxDecoration(
        color: Mycolor.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: SizeConfig.blockHeight * 11,
              width: SizeConfig.blockHeight * 11,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: SizeConfig.blockWidth * 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: FontStyles.welcome),
                Text(
                  specialty,
                  style: FontStyles.haveanaccount.copyWith(
                    color: Mycolor.darkgrey.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: SizeConfig.blockHeight * 1.2),

                // Rating without shadow
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: SizeConfig.blockWidth * 4.2,
                      color: Mycolor.lightblue,
                    ),
                    SizedBox(width: SizeConfig.blockWidth * 1.5),
                    Text(rating, style: FontStyles.articalcontant),
                  ],
                ),

                SizedBox(height: SizeConfig.blockHeight * 0.8),

                // Location
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: SizeConfig.blockWidth * 4.2,
                      color: Mycolor.lightblue,
                    ),
                    SizedBox(width: SizeConfig.blockWidth * 1.5),
                    Text(distance, style: FontStyles.articalcontant),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
