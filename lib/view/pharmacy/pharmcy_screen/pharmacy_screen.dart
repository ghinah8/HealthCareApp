import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/pharmacy/pharmacy_controller/pharmacy_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/custom_searchbar.dart';
import 'package:healthcare/widget/helpful_widget/medicine.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text(
              'Pharmacy',
              style: FontStyles.pharmacy,
            ),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
      body: GetBuilder(
          init: PharmacyController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomSearchBar(
                      backgroundcolor: Mycolor.grey.withOpacity(0.04),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Mycolor.lightblue.withAlpha(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Order quickly with',
                                  style: FontStyles.pharmacy,
                                ),
                                Text(
                                  'Prescription',
                                  style: FontStyles.pharmacy,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ButtonCustom(
                                    textbutton: 'Upload Prescription',
                                    colorbutton: Mycolor.lightblue,
                                    hieght: 40,
                                    width: 200,
                                    textstyel: FontStyles.pharmacyupload,
                                    onpressed: () {})
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(AppImage.prescription)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Product',
                          style: FontStyles.popularproduct,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.seeallmedicine);
                            },
                            child: Text(
                              'See all',
                              style: FontStyles.seeall,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 600,
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return GridView.builder(
                          physics:
                              NeverScrollableScrollPhysics(), // حتى ما يصطدم مع SingleChildScrollView
                          shrinkWrap: true,
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                              medicinecapacity: product.capacity,
                              medicineid: product.id,
                            );
                          },
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
