import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';

class RadiologyScreen extends StatelessWidget {
  const RadiologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 48.0),
            child: Text(
              'Radiology Result',
              style: FontStyles.pharmacy,
            ),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Report Date: Jan 15, 2025',
              style: FontStyles.reportdate,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'MRI Scan - Brain',
              style: FontStyles.mri,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Performed by Dr. Sarah Johnson Memorial Hospital',
              style: FontStyles.reportdate,
              maxLines: 2,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Key Findings',
              style: FontStyles.keyfinding,
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Mycolor.check,
                ),
                Text(
                  '  No abnormal masses detected',
                  style: FontStyles.sgins,
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Mycolor.check,
                ),
                Text(
                  ' Normal brain structure and tissue',
                  style: FontStyles.sgins,
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.close,
                  color: Mycolor.redcolor,
                ),
                Text(
                  '  Minor inflammation in sinuses',
                  style: FontStyles.sgins,
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Scan Image',
              style: FontStyles.mri,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Image.asset(AppImage.brain1),
                SizedBox(
                  width: 20,
                ),
                Image.asset(AppImage.brain2)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ButtonCustom(
              textbutton: 'Send Results to Doctor',
              colorbutton: Mycolor.lightblue,
              hieght: 60,
              width: double.infinity,
              textstyel: FontStyles.buy,
              onpressed: () {},
              iconData: Icons.send_outlined,
              iconcolor: Mycolor.white,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonCustom(
              textbutton: 'Download Report',
              colorbutton: Mycolor.grey.withAlpha(50),
              hieght: 60,
              width: double.infinity,
              textstyel: FontStyles.sginupbutton,
              onpressed: () {},
              iconData: Icons.download_outlined,
              iconcolor: Mycolor.lightblue,
            ),
          ],
        ),
      ),
    );
  }
}
