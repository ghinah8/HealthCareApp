import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int completedSteps;

  const CustomProgressIndicator({
    required this.totalSteps,
    required this.completedSteps,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps * 2 - 1, (index) {
        if (index.isOdd) {
          return Expanded(
            child: Container(
              height: 5,
              color: (index ~/ 2) < completedSteps
                  ? Colors.blue
                  : Colors.grey[300],
            ),
          );
        } else {
          return Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index ~/ 2) < completedSteps
                  ? Colors.blue
                  : Colors.grey[300],
              border: Border.all(
                color: (index ~/ 2) < completedSteps
                    ? Colors.blue
                    : Colors.grey[300]!,
                width: 2,
              ),
            ),
          );
        }
      }),
    );
  }
}
