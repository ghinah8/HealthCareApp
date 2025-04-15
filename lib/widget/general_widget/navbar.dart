// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../core/const_data/app_colors.dart';
import '../../media_query_service.dart';

class BottomNavBar extends StatelessWidget {
  final Function()? onPressedHome;
  final Function()? onPressedReports;
  final Function()? onPressedNotifications;
  final Function()? onPressedProfile;
  final bool isSelectedHome;
  final bool isSelectedReports;
  final bool isSelectedNotifications;
  final bool isSelectedProfile;

  const BottomNavBar({
    Key? key,
    this.onPressedHome,
    this.onPressedReports,
    this.onPressedNotifications,
    this.onPressedProfile,
    required this.isSelectedHome,
    required this.isSelectedReports,
    required this.isSelectedNotifications,
    required this.isSelectedProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize the SizeConfig

    return Container(
      height: SizeConfig.heightPercentage(9), // 8% of screen height
      decoration: BoxDecoration(color: Mycolor.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5), // Light shadow color
          blurRadius: 10, // Soft blur
          spreadRadius: 3, // Subtle spread
          offset: Offset(0, 5), // Slight downward shadow
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.translate(
              offset: Offset(SizeConfig.widthPercentage(-6), -5),
              child: IconButton(
                onPressed: onPressedHome,
                icon: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isSelectedHome)
                      Icon(
                        Icons.home,
                        size: SizeConfig.widthPercentage(9),
                        color: Mycolor.lightblue,
                      )
                    else
                      Icon(
                        Icons.home_outlined,
                        size: SizeConfig.widthPercentage(8),
                        color: Mycolor.lightgrey,
                      )
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(SizeConfig.widthPercentage(-3), -5),
              child: IconButton(
                onPressed: onPressedReports,
                icon: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isSelectedReports)
                      Icon(
                        Icons.monitor_heart,
                        size: SizeConfig.widthPercentage(9),
                        color: Mycolor.lightblue,
                      )
                    else
                      Icon(
                        Icons.monitor_heart_outlined,
                        size: SizeConfig.widthPercentage(8),
                        color: Mycolor.lightgrey,
                      )
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(SizeConfig.widthPercentage(4), -5),
              child: IconButton(
                onPressed: onPressedNotifications,
                icon: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isSelectedNotifications)
                      Icon(
                        Icons.notifications,
                        size: SizeConfig.widthPercentage(9),
                        color: Mycolor.lightblue,
                      )
                    else
                      Icon(
                        Icons.notifications_none_outlined,
                        size: SizeConfig.widthPercentage(8),
                        color: Mycolor.lightgrey,
                      )
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(SizeConfig.widthPercentage(6), -5),
              child: IconButton(
                onPressed: onPressedProfile,
                icon: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isSelectedProfile)
                      Icon(
                        Icons.person,
                        size: SizeConfig.widthPercentage(9),
                        color: Mycolor.lightblue,
                      )
                    else
                      Icon(
                        Icons.person_outlined,
                        size: SizeConfig.widthPercentage(8),
                        color: Mycolor.lightgrey,
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
