import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';

class NotificationListView extends StatelessWidget {
  final Map<String, List<Map<String, String>>> notifications;

  const NotificationListView({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockWidth * 5,
        0,
        SizeConfig.blockWidth * 5,
        SizeConfig.blockHeight * 10,
      ),
      children: notifications.entries.map((entry) {
        if (entry.value.isEmpty) return const SizedBox();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockHeight * 2,
                bottom: SizeConfig.blockHeight * 3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 5,
                      vertical: SizeConfig.blockHeight * 0.8,
                    ),
                    decoration: BoxDecoration(
                      color: Mycolor.lightblue.withAlpha(20),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      entry.key,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockWidth * 3.8,
                        color: Mycolor.lightblue,
                      ),
                    ),
                  ),
                  if (entry.key == "Today")
                    Text(
                      "Mark all",
                      style: TextStyle(
                        fontSize: SizeConfig.blockWidth * 3.5,
                        color: Mycolor.lightblue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
            ...entry.value.map((notif) {
              return Container(
                margin: EdgeInsets.only(
                  bottom: SizeConfig.blockHeight * 2.5,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SizeConfig.blockWidth * 10,
                      height: SizeConfig.blockWidth * 10,
                      margin: EdgeInsets.only(
                        right: SizeConfig.blockWidth * 2,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(notif['title'] ?? '',
                                    style: FontStyles.notificationstitle),
                              ),
                              Text(
                                notif['time'] ?? '',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockWidth * 3.3,
                                  color: Mycolor.lightgrey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(notif['desc'] ?? '',
                              style: FontStyles.notificationscontain),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        );
      }).toList(),
    );
  }
}
