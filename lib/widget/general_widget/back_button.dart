import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/media_query_service.dart';

class Backbutton extends StatelessWidget {
  const Backbutton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: Get.back,
      icon: Icon(Icons.arrow_back_ios, size: SizeConfig.widthPercentage(5)),
    );
  }
}
