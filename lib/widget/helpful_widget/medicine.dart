import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/view/cart/cart_cotroller/cart_controller.dart';
import 'package:healthcare/view/medicine_details/medicinedetails_screen/medicinedetails_screen.dart';

class Medicine extends StatelessWidget {
  const Medicine(
      {required this.medicinename,
      required this.medicineprice,
      required this.medicineimage});
  final String medicinename;
  final double medicineprice;
  final String medicineimage;
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Container(
      height: 200,
      width: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Mycolor.white,
          border: Border.all(color: Mycolor.grey.withAlpha(80), width: 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
        child: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            IconButton(
              onPressed: () {
                Get.to(() => MedicinedetailsScreen(
                      name: medicinename,
                      image: medicineimage,
                      price: medicineprice,
                      description: 'this part will resolve it later',
                    ));
              },
              icon: Image.asset(
                medicineimage,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                medicinename,
                style: FontStyles.medicinename,
              ),
            ),
            Row(
              children: [
                Text(
                  '\$$medicineprice',
                  style: FontStyles.medicinename,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Container(
                    width: 28,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Mycolor.lightblue),
                    child: Center(
                      child: IconButton(
                          padding:
                              EdgeInsets.only(right: 15, bottom: 3, left: 0),
                          onPressed: () {
                            Get.find<CartController>().addItem(
                                medicinename, medicineimage, medicineprice, 1);
                          },
                          icon: Icon(
                            Icons.add,
                            color: Mycolor.white,
                            size: 28,
                          )),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
