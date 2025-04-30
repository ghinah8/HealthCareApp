import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';

class Availabletime extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const Availabletime({
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              isSelected ? Mycolor.lightblue : Mycolor.lightblue.withAlpha(34),
        ),
        child: Center(
          child: Text(
            time,
            style: isSelected
                ? FontStyles.time.copyWith(color: Mycolor.white)
                : FontStyles.time,
          ),
        ),
      ),
    );
  }
}
