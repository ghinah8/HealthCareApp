import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/view/eligibility/eligilbility_controller/eligilbility_controller.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/custom_progress_indicator.dart';
import 'package:healthcare/widget/helpful_widget/question_widget.dart';

class EligibilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Theme(
      data: Theme.of(context)
          .copyWith(scaffoldBackgroundColor: Colors.transparent),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Mycolor.themecolor, Mycolor.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: GetBuilder<EligibilityController>(
              init: EligibilityController(),
              builder: (controller) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text('Healthcare', style: FontStyles.healthcaretitle),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Check your eligibility to provide information about your general medical history before booking an appointment with your doctor.',
                        style: FontStyles.longtitle,
                      ),
                      SizedBox(height: 30),
                      CustomProgressIndicator(
                        totalSteps: 5,
                        completedSteps: controller.completedSteps,
                      ),
                      SizedBox(height: 40),
                      Text('Prevaccination Checklist',
                          style: FontStyles.questionhealthcare),
                      SizedBox(height: 10),

                      // السؤال الأول
                      QuestionWidget(
                        question:
                            'Do you have any chronic medical conditions (such as diabetes, blood pressure, asthma)?',
                        value: controller.chronicConditions.value,
                        onChanged: (val) {
                          controller.chronicConditions.value = val;
                          controller.update();
                        },
                      ),
                      SizedBox(height: 20),

                      // السؤال الثاني
                      QuestionWidget(
                        question: 'Have you had any surgeries before?',
                        value: controller.surgeries.value,
                        onChanged: (val) {
                          controller.surgeries.value = val;
                          controller.update();
                        },
                      ),
                      SizedBox(height: 20),

                      // السؤال الثالث
                      QuestionWidget(
                        question:
                            'Are there any hereditary conditions in your family (such as cancer, heart disease)?',
                        value: controller.hereditaryConditions.value,
                        onChanged: (val) {
                          controller.hereditaryConditions.value = val;
                          controller.update();
                        },
                      ),
                      SizedBox(height: 20),

                      // السؤال الرابع
                      QuestionWidget(
                        question:
                            'Are you currently taking any medications? If so, what are the medications and doses?',
                        value: controller.medications.value,
                        onChanged: (val) {
                          controller.medications.value = val;
                          controller.update();
                        },
                      ),
                      SizedBox(height: 10),
                      if (controller.medications.value == true)
                        TextField(
                          controller: controller.medicationsController,
                          decoration: InputDecoration(
                            hintText: 'What are the medications?',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Mycolor.lightblue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),

                      SizedBox(height: 20),

                      // السؤال الخامس
                      QuestionWidget(
                        question:
                            'Do you have any allergies to certain medication?',
                        value: controller.allergies.value,
                        onChanged: (val) {
                          controller.allergies.value = val;
                          controller.update();
                        },
                      ),
                      SizedBox(height: 10),
                      if (controller.allergies.value == true)
                        TextField(
                          controller: controller.allergiesController,
                          decoration: InputDecoration(
                            hintText: 'What are the allergies?',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Mycolor.lightblue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),

                      SizedBox(height: 20),

                      // Check icon
                      Center(
                        child: Icon(
                          controller.completedSteps == 5
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: controller.completedSteps == 5
                              ? Mycolor.lightblue
                              : Mycolor.lightgrey.withAlpha(100),
                          size: 55,
                        ),
                      ),

                      SizedBox(height: 20),

                      // زر الاستمرار
                      Center(
                        child: ButtonCustom(
                          textbutton: "Continue",
                          colorbutton: controller.completedSteps == 5
                              ? Mycolor.lightblue
                              : Mycolor.lightgrey.withAlpha(100),
                          hieght: 50,
                          width: 250,
                          textstyel: TextStyle(
                            color: Mycolor.white,
                            fontSize: 24,
                          ),
                          onpressed: () {
                            if (controller.completedSteps == 5) {
                              Get.toNamed(Routes.patientdetailScreen);
                            } else {
                              Get.snackbar('Please answer the questions',
                                  'you cannot continue without your answer');
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
