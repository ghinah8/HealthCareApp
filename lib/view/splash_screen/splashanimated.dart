import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/view/splash_screen/splash_controller/splash_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Mycolor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/image/Animation - 1740761822262.json', // تأكدي من الاسم الجديد
            ),
            const SizedBox(height: 20),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.teal, Colors.blueAccent],
                ).createShader(bounds);
              },
              child: Text(
                '﴾ وَإِذَا مَرِضْتُ فَهُوَ يَشْفِينِ ﴿',
                style: FontStyles.healthcare.copyWith(
                  fontSize: 24,
                  color: Colors.white, // ضروري للـ ShaderMask
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.blueAccent, Colors.teal],
                ).createShader(bounds);
              },
              child: Text(
                'Healthcare',
                style: FontStyles.healthcare.copyWith(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
