import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 48.0),
            child: Text(
              'Card Info',
              style: FontStyles.pharmacy,
            ),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
    );
  }
}
