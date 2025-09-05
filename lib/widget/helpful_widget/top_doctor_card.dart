// widget/top_doctor_card.dart
import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/service/link.dart';

class TopDoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String specialty;
  // final String rating;
  final String location;
  final VoidCallback ontap;

  const TopDoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.specialty,
    // required this.rating,
    required this.location,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
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
              child: Image.network(
                AppLink.fixImageUrl(image),
                height: SizeConfig.blockHeight * 10,
                width: SizeConfig.blockHeight * 10,
              ),
            ),
            SizedBox(width: SizeConfig.blockWidth * 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: FontStyles.welcome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    specialty,
                    style: FontStyles.haveanaccount.copyWith(
                      color: Mycolor.darkgrey.withOpacity(0.6),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1.2),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: SizeConfig.blockWidth * 4.2,
                        color: Mycolor.lightblue,
                      ),
                      SizedBox(width: SizeConfig.blockWidth * 1.5),
                      Expanded(
                        child: Text(
                          location,
                          style: FontStyles.articalcontant,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Rating without shadow
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.star,
                  //       size: SizeConfig.blockWidth * 4.2,
                  //       color: Mycolor.lightblue,
                  //     ),
                  //     SizedBox(width: SizeConfig.blockWidth * 1.5),
                  //     Text(rating, style: FontStyles.articalcontant),
                  //   ],
                  // ),