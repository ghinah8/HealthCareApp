import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
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
      body: Padding(
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
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: FontStyles.seeall,
                      ))
                ],
              ),
              SizedBox(
                height: 500,
                child: GridView.count(
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 28,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Disable internal scrolling

                  children: [
                    Medicine(
                        medicinename: 'Panadol',
                        medicineprice: 15.99,
                        medicineimage: AppImage.medicine1),
                    Medicine(
                        medicinename: 'Bodrex',
                        medicineprice: 7.5,
                        medicineimage: AppImage.medicine2),
                    Medicine(
                      medicinename: 'OBH Combi',
                      medicineprice: 99.9,
                      medicineimage: AppImage.medicine3,
                    ),
                    Medicine(
                        medicinename: 'Betadine',
                        medicineprice: 6.8,
                        medicineimage: AppImage.medicine4),
                    Medicine(
                        medicinename: 'Panadol',
                        medicineprice: 4.5,
                        medicineimage: AppImage.medicine1),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
