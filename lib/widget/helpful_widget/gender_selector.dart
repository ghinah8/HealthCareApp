import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';

class GenderSelector extends StatelessWidget {
  final Function(String?) onGenderSelected; // تغيير إلى String?
  final String? selectedGender;

  const GenderSelector({
    super.key, // إضافة super.key
    required this.onGenderSelected,
    this.selectedGender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Mycolor.black, // إضافة لون ثابت
          ),
        ),
        SizedBox(height: 15),
        Row(
          children: [
            _buildGenderRadio("Male"),
            SizedBox(width: 50),
            _buildGenderRadio("Female"),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderRadio(String gender) {
    final isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        // إذا كان محدداً بالفعل، قم بإلغاء التحديد
        if (isSelected) {
          onGenderSelected(null);
        } else {
          onGenderSelected(gender);
        }
      },
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey,
                width: 2,
              ),
              color: isSelected ? Colors.blue : Colors.transparent,
            ),
            child: isSelected
                ? Icon(Icons.check, size: 15, color: Colors.white)
                : null,
          ),
          SizedBox(width: 8),
          Text(
            gender,
            style: TextStyle(
              fontSize: 16,
              // color: isSelected
              //     ? Colors.blue
              //     : Colors.black87, // تغيير اللون عند التحديد),
            ),
          ),
        ],
      ),
    );
  }
}
