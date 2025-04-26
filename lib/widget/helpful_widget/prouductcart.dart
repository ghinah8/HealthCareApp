import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';

class Prouductcart extends StatelessWidget {
  const Prouductcart(
      {super.key,
      required this.decrement,
      required this.increment,
      required this.sum,
      required this.number,
      required this.delete,
      required this.medicineimage,
      required this.medicinename});
  final VoidCallback decrement;
  final VoidCallback increment;
  final VoidCallback delete;
  final String sum;
  final String number;
  final String medicineimage;
  final String medicinename;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          padding:
              const EdgeInsets.all(10), // حتى نتجنب مشاكل الـ Padding المتعددة
          decoration: BoxDecoration(
            color: Mycolor.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: Mycolor.lightgrey.withAlpha(100), width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(medicineimage, width: 80, height: 80),
              const SizedBox(width: 10),
              Expanded(
                // هذا مهم ليخلي الـ Column جوات Row يأخذ عرض مناسب
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            medicinename,
                            style: FontStyles.cartmidicinename,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: delete,
                          icon: Icon(Icons.delete_outline,
                              color: Mycolor.lightblue),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        IconButton(
                            onPressed: decrement,
                            icon: const Icon(Icons.remove)),
                        Text(number, style: FontStyles.medicinumber),
                        const SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 28,
                          decoration: BoxDecoration(
                            color: Mycolor.lightblue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: increment,
                            icon:
                                Icon(Icons.add, color: Mycolor.white, size: 15),
                          ),
                        ),
                        const Spacer(),
                        Text('\$$sum', style: FontStyles.price),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
