import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/pharmacy/pharmacy_controller/pharmacy_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/helpful_widget/medicine.dart';

class Seeallproduct extends StatelessWidget {
  const Seeallproduct({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PharmacyController controller = Get.put(PharmacyController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Mycolor.lightblue,
        onPressed: () {
          Get.toNamed(Routes.cartScreen);
        },
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Mycolor.white,
          size: 40,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text(
              'All Product',
              style: FontStyles.pharmacy,
            ),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
      backgroundColor: Mycolor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: SizedBox(
          height: double.infinity,
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            return GridView.builder(
              shrinkWrap: true,
              itemCount: controller.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 28,
              ),
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return Medicine(
                  medicinename: product.name,
                  medicineprice: product.price,
                  medicineimage: product.image,
                  medicinedescription: product.description,
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
