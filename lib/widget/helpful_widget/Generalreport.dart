import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';

class Generalreport extends StatelessWidget {
  const Generalreport(
      {required this.title,
      required this.date,
      required this.onpressed,
      required this.moreonpressed});
  final String title;
  final String date;
  final VoidCallback onpressed;
  final VoidCallback moreonpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Mycolor.grey.withAlpha(70), width: 1),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Mycolor.lightblue.withAlpha(50),
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                    onPressed: onpressed,
                    icon: Icon(
                      Icons.monitor_heart_outlined,
                      color: Mycolor.lightblue,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontStyles.generalreport,
                  ),
                  Text(
                    date,
                    style: FontStyles.date,
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 80.0, bottom: 20),
                child: IconButton(
                    onPressed: moreonpressed, icon: Icon(Icons.more_horiz)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
