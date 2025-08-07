import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/view/allappointment/allapointment_controller/allappointment_controller.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final AppointmentFilter filter;

  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    final isComplete = filter == AppointmentFilter.complete;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Mycolor.lightblue.withAlpha(40),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(AppImage.doctorimage),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctorName, style: FontStyles.drolivia),
                Text(specialization, style: FontStyles.cardiology),
                const SizedBox(height: 6),
                if (isComplete) ...[
                  Row(
                    children: [
                      ButtonCustom(
                        textbutton: 'Re-Book',
                        colorbutton: Mycolor.white,
                        hieght: 35,
                        width: 120,
                        textstyel: FontStyles.rebook,
                        onpressed: () {},
                      ),
                      const SizedBox(width: 10),
                      ButtonCustom(
                        textbutton: 'Add Review',
                        colorbutton: Mycolor.lightblue,
                        hieght: 35,
                        width: 120,
                        textstyel: FontStyles.addreview,
                        onpressed: () {},
                      ),
                    ],
                  ),
                ] else ...[
                  Container(
                    width: 150,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_month,
                            color: Colors.grey, size: 16),
                        SizedBox(width: 5),
                        Text('Sunday, 18 Aug'),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      ButtonCustom(
                        textbutton: 'Details',
                        colorbutton: Mycolor.lightblue,
                        hieght: 35,
                        width: 150,
                        textstyel: FontStyles.addreview,
                        onpressed: () {},
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 35,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 35,
                      ),
                    ],
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
