import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/routes.dart';
import 'package:healthcare/service/my_sevice.dart';
import 'package:healthcare/view/auth/auth_controller/auth_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';
import 'package:healthcare/widget/general_widget/button_custom.dart';
import 'package:healthcare/widget/helpful_widget/textfield_custom.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.only(left: SizeConfig.widthPercentage(6)),
            child: Backbutton()),
        backgroundColor: Mycolor.white,
        toolbarHeight: SizeConfig.heightPercentage(10),
        title: Padding(
          padding: EdgeInsets.only(right: SizeConfig.widthPercentage(10)),
          child: Center(
            child: Text(
              'Sign Up',
              style: FontStyles.authtitle
                  .copyWith(fontSize: SizeConfig.widthPercentage(5)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthPercentage(6)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.heightPercentage(3)),
                    TextfieldCustom(
                      hinttext: 'Enter your name',
                      scuretext: false,
                      iconData: Icons.person_2_outlined,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(3)),
                    TextfieldCustom(
                      hinttext: 'Enter your Email',
                      scuretext: false,
                      iconData: Icons.email_outlined,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(3)),
                    TextfieldCustom(
                      hinttext: 'Enter your Phone Number',
                      scuretext: false,
                      iconData: Icons.phone_outlined,
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone Number can not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(3)),
                    TextfieldCustom(
                      hinttext: 'Enter your password',
                      iconData: Icons.lock_outline,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        return null;
                      },
                      iconsuffix: IconButton(
                        icon: controller.recovery
                            ? Icon(
                                Icons.visibility_off_outlined,
                                size: SizeConfig.widthPercentage(8),
                                color: Mycolor.lightgrey.withOpacity(0.3),
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                size: SizeConfig.widthPercentage(8),
                                color: Mycolor.lightgrey.withOpacity(0.3),
                              ),
                        onPressed: controller.isrcover,
                      ),
                      scuretext: controller.recovery,
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(2.5)),
                    ButtonCustom(
                      onpressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String name = nameController.text;
                          String email = emailController.text;
                          String password = passwordController.text;
                          String phonenumber = phoneController.text;

                          // Call the signUp method in AuthController
                          AuthController authController = Get.find();
                          authController.signUp(
                              name, email, password, phonenumber);
                        }
                        final userService = Get.find<UserService>();
                        await userService.saveUsername(nameController.text,
                            saveToPreferences: true);
                      },
                      textbutton: 'Sign Up',
                      colorbutton: Mycolor.lightblue,
                      width: SizeConfig.widthPercentage(90),
                      hieght: SizeConfig.heightPercentage(7),
                      textstyel: FontStyles.loginbutton,
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'you have an account?',
                          style: FontStyles.haveanaccount,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.loginscreen);
                            },
                            child: Text(
                              'Sign In',
                              style: FontStyles.authtextbutton,
                            ))
                      ],
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(2)),
                    Row(
                      children: [
                        Text(
                          '──────────────',
                          style: FontStyles.ortext,
                        ),
                        Text(
                          'OR',
                          style: FontStyles.ortext,
                        ),
                        Text(
                          '──────────────',
                          style: FontStyles.ortext,
                        )
                      ],
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(2)),
                    Text(
                      'Sign Up with',
                      style: FontStyles.sgininanotherway,
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.facebookAccount),
                        SizedBox(width: SizeConfig.heightPercentage(2)),
                        Image.asset(AppImage.google)
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
