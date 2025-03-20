import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/text_style.dart';

class Unsedwidget extends StatelessWidget {
  const Unsedwidget(
      {required this.image, required this.name, required this.namenumber});
  final String image;
  final String name;
  final String namenumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: FontStyles.heartrat,
        ),
        Text(
          namenumber,
          style: FontStyles.heartratnumber,
        )
      ],
    );
  }
}
