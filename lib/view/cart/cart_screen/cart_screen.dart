import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/modle/createMeicineOrder.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/cart/cart_cotroller/cart_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/prouductcart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final TextEditingController addressController = TextEditingController();
  final String startHourController = "12:00";
  final String endHourController = "12:30";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final CartController controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text('My Cart', style: FontStyles.pharmacy),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<CartController>(
                builder: (_) {
                  if (controller.cartItems.isEmpty) {
                    return const Center(
                      child: Text('No item added to the cart'),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.cartItems[index];
                      return Prouductcart(
                        medicineimage: item.image,
                        medicinename: item.name,
                        number: item.quantity.toString(),
                        sum: item.total.toStringAsFixed(1),
                        increment: () => controller.inc(item.name),
                        decrement: () => controller.dec(item.name),
                        delete: () => controller.removeItem(item.name),
                        medicineId: item.id,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // عنوان
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Total', style: FontStyles.taxes),
                      Text('\$${controller.totalSum.toStringAsFixed(1)}',
                          style: FontStyles.totalprice),
                    ],
                  ),
                  ButtonCustom(
                    textbutton: controller.isLoading.value
                        ? 'Processing...'
                        : 'Checkout',
                    colorbutton: Mycolor.lightblue,
                    hieght: 50,
                    width: 140,
                    textstyel: FontStyles.buy,
                    onpressed: controller.isLoading.value
                        ? null
                        : () {
                            if (controller.cartItems.isEmpty) return;
                            if (addressController.text.isEmpty ||
                                startHourController.isEmpty ||
                                endHourController.isEmpty) {
                              Get.snackbar("Error", "Please fill all fields");
                              return;
                            }

                            // تحويل CartItems إلى ProductList باستخدام الـID
                            List<ProductList> products =
                                controller.cartItems.map((item) {
                              return ProductList(
                                  productId: item.id, quantity: item.quantity);
                            }).toList();

                            CreateMedicineOrder order = CreateMedicineOrder(
                              productList: products,
                              address: addressController.text,
                              startHour: startHourController,
                              endHour: endHourController,
                            );

                            controller.createMedicineOrder(order);
                            Get.toNamed(Routes.cardinfoscreen);
                          },
                  ),
                ],
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
