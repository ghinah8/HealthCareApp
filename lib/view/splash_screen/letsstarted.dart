import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';

class LetstartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Image.asset(
                AppImage.frame,
                width: 150,
                height: 150,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text('Healthcare', style: FontStyles.healthcare),
            ),
            SizedBox(height: 25),
            Text("Let's Get Started !", style: FontStyles.letsgetstarted),
            Text('Login to Stay healthy and fit',
                style: FontStyles.logintostayhealthy),
            SizedBox(height: 30),
            ButtonCustom(
                textbutton: "Login",
                colorbutton: Mycolor.lightblue,
                hieght: SizeConfig.heightPercentage(6),
                width: SizeConfig.widthPercentage(50),
                textstyel: FontStyles.loginbutton,
                onpressed: () {
                  Get.toNamed(Routes.loginscreen);
                }),
            SizedBox(
              height: 20,
            ),
            ButtonCustom(
              textbutton: "Sign Up",
              colorbutton: Mycolor.grey.withAlpha(15),
              hieght: SizeConfig.heightPercentage(6),
              width: SizeConfig.widthPercentage(50),
              textstyel: FontStyles.sginupbutton,
              onpressed: () {
                Get.toNamed(Routes.signupscreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
