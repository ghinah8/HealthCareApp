// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/widget/helpful_widget/agedropdownage.dart';

class TextfieldCustom extends StatelessWidget {
  final String hinttext;
  final bool scuretext;
  final IconData? iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? label;
  final void Function(String)? onchange;
  final TextInputType? keybordtype;
  final bool isDropdown;
  var iconsuffix;

  TextfieldCustom({
    required this.hinttext,
    required this.scuretext,
    this.iconData,
    required this.controller,
    this.validator,
    this.iconsuffix,
    this.label,
    this.onchange,
    this.keybordtype,
    this.isDropdown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.widthPercentage(100),
      height: SizeConfig.heightPercentage(10),
      child: SizedBox(
        width: SizeConfig.widthPercentage(90),
        height: SizeConfig.heightPercentage(7),
        child: isDropdown
            ? AgeDropdownField()
            : TextFormField(
                keyboardType: keybordtype,
                onChanged: onchange,
                controller: controller,
                obscureText: scuretext,
                validator: validator,
                decoration: InputDecoration(
                  label: label != null ? Text(label!) : null,
                  helperText: "  ",
                  filled: true,
                  fillColor: Mycolor.grey.withOpacity(0.03),
                  suffixIcon: Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.widthPercentage(3)),
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
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Mycolor.navyblue)),
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
