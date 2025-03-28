import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';

class Medicine extends StatelessWidget {
  const Medicine(
      {required this.medicinename,
      required this.medicineprice,
      required this.medicineimage});
  final String medicinename;
  final String medicineprice;
  final String medicineimage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Mycolor.white,
          border: Border.all(color: Mycolor.grey.withAlpha(80), width: 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
        child: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            Image.asset(
              medicineimage,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                medicinename,
                style: FontStyles.medicinename,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$medicineprice',
                  style: FontStyles.medicinename,
                ),
                Container(
                  width: 24,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Mycolor.lightblue),
                  child: IconButton(
                      padding: EdgeInsets.only(right: 15, bottom: 3, left: 0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Mycolor.white,
                        size: 28,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
