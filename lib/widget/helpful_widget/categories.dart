import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';

class Categories extends StatelessWidget {
  const Categories(
      {required this.categoryname,
      required this.icon,
      required this.onpressed});
  final String categoryname;
  final String icon;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Mycolor.lightblue,
          minRadius: 8,
          maxRadius: 30,
          child: IconButton(
              onPressed: onpressed,
              icon: Image.asset(
                icon,
                height: 50,
                width: 50,
              )),
        ),
        Text(
          categoryname,
          style: FontStyles.categoriess,
        )
      ],
    );
  }
}
