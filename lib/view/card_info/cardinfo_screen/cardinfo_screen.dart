// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/card_info/cardinfo_controller/cardinfo_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/textfield_custom.dart';

class CardinfoScreen extends StatelessWidget {
  CardinfoScreen({super.key});
  TextEditingController cardname = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController expirydate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 48.0),
            child: Text(
              'Card Info',
              style: FontStyles.pharmacy,
            ),
          ),
        ),
        leading: Backbutton(),
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: GetBuilder(
            init: CardinfoController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Image.asset(AppImage.card),
                    SizedBox(
                      height: 50,
                    ),
                    TextfieldCustom(
                        hinttext: 'Card Number',
                        scuretext: false,
                        controller: cardnumber),
                    Row(
                      children: [
                        Checkbox(
                          value: controller.checkboxstate.value,
                          onChanged: controller.toggleCheckbox,
                          activeColor: Mycolor.lightblue,
                        ),
                        Text(
                          'I agree to the Terms and Conditions',
                          style: FontStyles.iagree,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    ButtonCustom(
                        textbutton: 'Buy',
                        colorbutton: Mycolor.lightblue,
                        hieght: 60,
                        width: 300,
                        textstyel: FontStyles.buy,
                        onpressed: () {
                          if (controller.checkboxstate.value == true) {
                            Get.dialog(
                              Center(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Mycolor.white,
                                  child: Container(
                                    width: Get.width * 0.8,
                                    height: Get.height * 0.5,
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              Mycolor.bublechatrecivecolor,
                                          radius: 50,
                                          child: Icon(
                                            Icons.thumb_up,
                                            color: Mycolor.lightblue,
                                            size: 50,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'Thank you!',
                                          style: FontStyles.thankyou,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'You have agreed to the terms and completed your payment successfully',
                                          textAlign: TextAlign.center,
                                          style: FontStyles.underthankyou,
                                        ),
                                        SizedBox(height: 20),
                                        ButtonCustom(
                                            textbutton: 'Done',
                                            colorbutton: Mycolor.lightblue,
                                            hieght: 50,
                                            width: 80,
                                            textstyel: FontStyles.buy,
                                            onpressed: () {
                                              Get.toNamed(Routes.homescreen);
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              barrierDismissible:
                                  false, // اذا بدك المستخدم ما يقدر يسكر الديالوج بالضغط برا
                            );
                          } else {
                            Get.snackbar('Cannot continue',
                                'we cannot continue without your agreement ',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        })
                  ],
                ),
              );
            }),
      ),
    );
  }
}
