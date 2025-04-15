import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final bool? value;
  final Function(bool?) onChanged;

  QuestionWidget({
    required this.question,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    value == true
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: value == true ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    if (value == true) {
                      onChanged(null);
                    } else {
                      onChanged(true);
                    }
                  },
                ),
                Text('Yes'),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    value == false
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: value == false ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    if (value == false) {
                      onChanged(null);
                    } else {
                      onChanged(false);
                    }
                  },
                ),
                Text('No'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
