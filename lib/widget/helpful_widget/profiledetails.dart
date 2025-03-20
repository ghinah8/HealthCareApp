import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';

class Profiledetails extends StatelessWidget {
  const Profiledetails(
      {required this.iconimage,
      required this.text,
      required this.goto,
      required this.padding});
  final String iconimage;
  final String text;
  final VoidCallback goto;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          minRadius: 8,
          maxRadius: 23,
          backgroundColor: Mycolor.lightblue.withAlpha(50),
          child: IconButton(onPressed: goto, icon: Image.asset(iconimage)),
        ),
        SizedBox(
          width: 15,
        ),
        TextButton(
            onPressed: goto,
            child: Text(
              text,
              style: FontStyles.profiledetails,
            )),
        SizedBox(
          width: padding,
        ),
        IconButton(
            alignment: AlignmentDirectional.centerEnd,
            iconSize: 20,
            padding: EdgeInsets.all(0),
            onPressed: goto,
            icon: Icon(Icons.arrow_forward_ios))
      ],
    );
  }
}
