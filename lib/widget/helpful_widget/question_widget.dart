import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/text_style.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final bool? value;
  final Function(bool?) onChanged;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  Widget _buildOption(String label, bool optionValue) {
    final isSelected = value == optionValue;

    return InkWell(
      onTap: () {
        onChanged(isSelected ? null : optionValue);
      },
      child: Row(
        children: [
          Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(label, style: FontStyles.yesnoanswer),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: FontStyles.questionhealthcare),
        const SizedBox(height: 10),
        Column(
          children: [
            _buildOption('Yes', true),
            const SizedBox(height: 8),
            _buildOption('No', false),
          ],
        ),
      ],
    );
  }
}
