// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';

class TextfieldCustom extends StatelessWidget {
  final String hinttext;
  final bool scuretext;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  var iconsuffix;
  TextfieldCustom(
      {required this.hinttext,
      required this.scuretext,
      required this.iconData,
      required this.controller,
      this.validator,
      this.iconsuffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.widthPercentage(100),
      height: SizeConfig.heightPercentage(10),
      child: SizedBox(
        width: SizeConfig.widthPercentage(90),
        height: SizeConfig.heightPercentage(7),
        child: TextFormField(
          controller: controller,
          obscureText: scuretext,
          validator: validator,
          decoration: InputDecoration(
            helperText: "  ",
            filled: true,
            fillColor: Mycolor.grey.withOpacity(0.03),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: SizeConfig.widthPercentage(3)),
              child: iconsuffix,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthPercentage(3),
                  vertical: SizeConfig.widthPercentage(4)),
              child: Icon(
                iconData,
                size: SizeConfig.widthPercentage(8),
                color: Mycolor.lightgrey.withOpacity(0.3),
              ),
            ),
            hintText: hinttext,
            hintStyle: FontStyles.hinttext
                .copyWith(fontSize: SizeConfig.widthPercentage(4)),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Mycolor.lightgrey.withOpacity(0.1), width: 0.2),
              borderRadius:
                  BorderRadius.circular(SizeConfig.widthPercentage(2)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 255, 0, 0), width: 1),
              borderRadius:
                  BorderRadius.circular(SizeConfig.widthPercentage(2)),
            ),
          ),
        ),
      ),
    );
  }
}
