// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/patientdetail/patientdetail_controller/patientdetail_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/gender_selector.dart';
import 'package:healthcare/widget/helpful_widget/textfield_custom.dart';
import 'package:get/get.dart';

class PatientDetailsScreen extends StatelessWidget {
  final PatientController patientController = Get.put(PatientController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Backbutton(),
          title: Text('Patient Details', style: FontStyles.title),
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Mycolor.themecolor, Mycolor.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: GetBuilder<PatientController>(
              init: patientController,
              builder: (patientcontroller) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      // مؤشر التقدم
                      Obx(() {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Step ${patientController.currentStep.value}/${patientController.totalSteps}',
                                style: TextStyle(
                                  fontSize: 16 +
                                      (patientController.currentStep.value * 2),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: FractionallySizedBox(
                                    alignment: Alignment.centerLeft,
                                    widthFactor:
                                        patientController.currentStep.value /
                                            patientController
                                                .totalSteps, // نسبة الإكمال
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height: 40),

                      // حقل اسم المريض
                      TextfieldCustom(
                        hinttext: "ُEnter your Full Name",
                        scuretext: false,
                        controller: patientController.nameController.value,
                        label: "Patient's Name",
                        onchange: (value) {
                          patientController.patient.update(
                            (val) {
                              val?.name = value;
                            },
                          );
                          patientController.updateSteps();
                        },
                      ),
                      SizedBox(height: 30),

                      // حقل العمر
                      TextfieldCustom(
                        hinttext: "Day/Month/Year",
                        scuretext: false,
                        controller: TextEditingController(),
                        label: "Age",
                        onchange: (value) {
                          patientController.ageController.value.text = value;
                          patientController.patient.update(
                            (val) {
                              val?.age = value;
                            },
                          );
                          patientController.updateSteps();
                        },
                        isDropdown: true,
                      ),
                      SizedBox(height: 30),

                      // حقل اختيار الجنس
                      Obx(() {
                        return GenderSelector(
                          selectedGender:
                              patientController.patient.value.gender,
                          onGenderSelected: (gender) {
                            patientController.patient.update((val) {
                              val?.gender = gender;
                            });
                            patientController.updateSteps();
                          },
                        );
                      }),
                      SizedBox(height: 40),

                      // زر الإرسال
                      Center(
                        child: ButtonCustom(
                          textbutton: "Submit",
                          colorbutton: patientController.currentStep.value ==
                                  patientController.totalSteps
                              ? Mycolor.lightblue
                              : Colors.grey,
                          hieght: 55,
                          width: 230,
                          textstyel: TextStyle(
                            color: Mycolor.white,
                            fontSize: 24,
                          ),
                          onpressed: patientController.currentStep.value ==
                                  patientController.totalSteps
                              ? () {
                                  Get.toNamed(Routes.homescreen);
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
