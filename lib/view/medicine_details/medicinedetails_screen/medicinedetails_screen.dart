import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/service/link.dart';
import 'package:healthcare/view/cart/cart_cotroller/cart_controller.dart';
import 'package:healthcare/view/medicine_details/medicinedetails_controller/medicinedetails_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';

class MedicinedetailsScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final double price;
  final String capacity;
  final String id;
  const MedicinedetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.capacity,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text('Pharmacy', style: FontStyles.pharmacy),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
      body: GetBuilder<MedicinedetailsController>(
        init: MedicinedetailsController(initialPrice: price),
        builder: (controller) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        AppLink.fixImageUrl(image),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(name, style: FontStyles.medicinename2),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconButton(
                            onPressed: controller.dec,
                            icon: Icon(Icons.remove)),
                        Text(controller.number.toString(),
                            style: FontStyles.medicinumber),
                        SizedBox(width: 15),
                        Container(
                          height: 40,
                          width: 38,
                          decoration: BoxDecoration(
                              color: Mycolor.lightblue,
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                              onPressed: controller.inc,
                              icon: Icon(Icons.add, color: Mycolor.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 160.0),
                          child: Text('\$${controller.sum.toStringAsFixed(1)}',
                              style: FontStyles.price),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Capacity: $capacity',
                          style: FontStyles.description),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Description', style: FontStyles.description),
                    ),
                    SizedBox(height: 20),
                    Text(description, style: FontStyles.descriptiondetails),
                    SizedBox(height: 40),
                    ButtonCustom(
                      textbutton: 'Add to Cart',
                      colorbutton: Mycolor.lightblue,
                      hieght: 60,
                      width: 300,
                      textstyel: FontStyles.buy,
                      onpressed: () {
                        final cartController = Get.find<CartController>();
                        cartController.addItem(
                          id,
                          name,
                          image,
                          price,
                          controller.number,
                        );

                        Get.snackbar(
                          'Added to Cart',
                          '$name x${controller.number} added!',
                          backgroundColor: Colors.green.shade100,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
