// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom(
      {super.key,
      required this.textbutton,
      required this.colorbutton,
      required this.hieght,
      required this.width,
      required this.textstyel,
      required this.onpressed,
      this.iconData,
      this.iconcolor});
  final String textbutton;
  final Color colorbutton;
  final double hieght;
  final double width;
  final TextStyle textstyel;
  final IconData? iconData;
  final Color? iconcolor;
  var onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: hieght,
        decoration: BoxDecoration(
            color: colorbutton, borderRadius: BorderRadius.circular(55)),
        child: TextButton(
          onPressed: onpressed,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconData != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      iconData,
                      color: iconcolor,
                    ),
                  ),
                Text(
                  textbutton,
                  style: textstyel,
                ),
              ],
            ),
          ),
        ));
  }
}
