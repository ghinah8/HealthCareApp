import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/view/medicine_details/medicinedetails_controller/medicinedetails_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';

class MedicinedetailsScreen extends StatelessWidget {
  const MedicinedetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
      body: GetBuilder<MedicinedetailsController>(
          init: MedicinedetailsController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppImage.medicine3,
                      scale: 0.4,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'OBH Combi',
                      style: FontStyles.medicinename2,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.dec();
                          },
                          icon: Icon(Icons.remove)),
                      Text(
                        controller.number.toString(),
                        style: FontStyles.medicinumber,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 40,
                        width: 38,
                        decoration: BoxDecoration(
                            color: Mycolor.lightblue,
                            borderRadius: BorderRadius.circular(5)),
                        child: IconButton(
                            color: Mycolor.lightblue,
                            onPressed: () {
                              controller.inc();
                            },
                            icon: Icon(
                              Icons.add,
                              color: Mycolor.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 160.0),
                        child: Text(
                          '\$${controller.sum.toStringAsFixed(1)}',
                          style: FontStyles.price,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
                      style: FontStyles.description,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing.',
                    style: FontStyles.descriptiondetails,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonCustom(
                      textbutton: 'Buy',
                      colorbutton: Mycolor.lightblue,
                      hieght: 60,
                      width: 300,
                      textstyel: FontStyles.buy,
                      onpressed: () {})
                ],
              ),
            );
          }),
    );
  }
}
