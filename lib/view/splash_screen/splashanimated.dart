import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/view/splash_screen/secondscreen.dart';
import 'package:lottie/lottie.dart';

class splash_animated extends StatefulWidget {
  const splash_animated({super.key});

  @override
  State<splash_animated> createState() => _splash_animatedState();
}

class _splash_animatedState extends State<splash_animated> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnimatedSplashScreen(
      duration: 10000,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/image/Animation - 1740761822262.json',
          ),
          Text(
            '   ﴾ وَإِذَا مَرِضْتُ فَهُوَ يَشْفِينِ ﴿    ',
            style: FontStyles.healthcare,
          )
        ],
      ),
      nextScreen: const secondscreen(),
      splashIconSize: double.infinity,
      backgroundColor: Mycolor.white,
    );
  }
}
