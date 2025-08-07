// widget/services_list.dart
import 'package:flutter/material.dart';
import '../../media_query_service.dart';
import '../../core/const_data/text_style.dart';
import '../../core/const_data/app_colors.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  final List<String> services = const [
    "Patient care should be the number one priority.",
    "If you run your practice you know how frustrating.",
    "That’s why some of appointment reminder system.",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: FontStyles.authtitle.copyWith(
            fontSize: SizeConfig.blockWidth * 5,
            color: Mycolor.grey,
          ),
        ),
        const SizedBox(height: 5),
        ...List.generate(services.length, (index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}.",
                      style: FontStyles.authtitle.copyWith(
                        color: Mycolor.lightblue,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockWidth * 4.5,
                      ),
                    ),
                    const SizedBox(width: 8), // مسافة واضحة بين الرقم والجملة
                    Expanded(
                      child: Text(
                        services[index],
                        style: FontStyles.categoriess.copyWith(
                          color: Mycolor.navyblue,
                          fontSize: SizeConfig.blockWidth * 3.8,
                          fontWeight: FontWeight.w400,
                          height: 1.4, // محاذاة أفضل للأسطر
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (index != services.length - 1)
                Divider(
                  color: Mycolor.navyblue.withOpacity(0.1),
                  thickness: 1,
                  height: 20,
                ),
            ],
          );
        }),
      ],
    );
  }
}
