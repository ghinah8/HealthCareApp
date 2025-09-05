import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/service/link.dart';
import 'package:healthcare/view/cart/cart_cotroller/cart_controller.dart';
import 'package:healthcare/view/medicine_details/medicinedetails_screen/medicinedetails_screen.dart';

class Medicine extends StatelessWidget {
  const Medicine({
    super.key,
    required this.medicinename,
    required this.medicineprice,
    required this.medicineimage,
    required this.medicinedescription,
    required this.medicinecapacity,
    required this.medicineid,
  });

  final String medicinename;
  final double medicineprice;
  final String medicineimage;
  final String medicinedescription;
  final String medicinecapacity;
  final String medicineid;

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    return Container(
      height: 200,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Mycolor.white,
        border: Border.all(color: Mycolor.grey.withAlpha(80), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // لتقليل الضغط
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => MedicinedetailsScreen(
                      name: medicinename,
                      image: medicineimage,
                      price: medicineprice,
                      description: medicinedescription,
                      capacity: medicinecapacity,
                      id: medicineid,
                    ));
              },
              child: SizedBox(
                height: 80,
                child: Image.network(
                  AppLink.fixImageUrl(medicineimage),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                medicinename,
                style: FontStyles.medicinename,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '\$$medicineprice',
                    style: FontStyles.medicinename,
                  ),
                ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Mycolor.lightblue,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.find<CartController>().addItem(
                        medicineid,
                        medicinename,
                        medicineimage,
                        medicineprice,
                        1,
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      color: Mycolor.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
