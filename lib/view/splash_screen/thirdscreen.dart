import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/routes.dart';

class thirdscreen extends StatelessWidget {
  const thirdscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.white,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.signupscreen);
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffdcdee1),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImage.maledoctor,
                    width: 296,
                    height: 467,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
                      child: RichText(
                        text: TextSpan(
                          style: FontStyles.title,
                          children: [
                            TextSpan(
                              text: "Get advice only from a ",
                            ),
                            TextSpan(
                              text: "doctor you believe in.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50, right: 30),
                      child: FloatingActionButton(
                        onPressed: () {
                          Get.toNamed(Routes.letstarted);
                        },
                        backgroundColor: Colors.blue,
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
