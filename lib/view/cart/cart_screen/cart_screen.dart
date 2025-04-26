import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/view/cart/cart_cotroller/cart_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/prouductcart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text(
              'My Cart',
              style: FontStyles.pharmacy,
            ),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
      body: GetBuilder(
          init: CartController(),
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Expanded(
                    child: GetBuilder<CartController>(
                        init: CartController(),
                        builder: (controller) {
                          if (controller.cartItems.isEmpty) {
                            return Center(
                              child: Text('No item added to the cart'),
                            );
                          } else {
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
                                  delete: () =>
                                      controller.removeItem(item.name),
                                );
                              },
                            );
                          }
                        }),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Payment Details',
                      style: FontStyles.paymentdetail,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub Total',
                        style: FontStyles.taxes,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '\$${controller.totalSum.toStringAsFixed(1)}',
                        style: FontStyles.taxes,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'taxes',
                        style: FontStyles.taxes,
                      ),
                      Text(
                        '0.0',
                        style: FontStyles.taxes,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total',
                              style: FontStyles.taxes,
                            ),
                            Text(
                              '\$${controller.totalSum.toStringAsFixed(1)}',
                              style: FontStyles.totalprice,
                            )
                          ],
                        ),
                        ButtonCustom(
                            textbutton: 'Checkout',
                            colorbutton: Mycolor.lightblue,
                            hieght: 50,
                            width: 140,
                            textstyel: FontStyles.buy,
                            onpressed: () {})
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
