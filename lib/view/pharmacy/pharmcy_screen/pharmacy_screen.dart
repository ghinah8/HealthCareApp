import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Pharmacy',
            style: FontStyles.pharmacy,
          ),
        ),
        leading: Backbutton(),
      ),
    );
  }
}
