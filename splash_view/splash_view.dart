import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/app_service/local_storage.dart';
import 'package:paxify/modules/splash_view/splash_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/animation.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final SplashLogic logic;
  LocalStorage storage = LocalStorage();

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    final animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Initialize Logic with AnimationController
    logic = SplashLogic(animationController: animationController);

WidgetsBinding.instance.addPostFrameCallback((_) async {
      logic.state.controller.forward();

      // WAIT 4 seconds first, THEN check the token
      await Future.delayed(const Duration(seconds: 4));

      final token = await storage.getVarable('accessToken') ?? "";
      log("isPass from storage after delay: $token");

      if (token.isNotEmpty) {
        
          Get.toNamed(Routes.SIGNINVIEW);
      
      } else {
        // Get.toNamed(Routes.ONBOARDING);
        Get.toNamed(Routes.SIGNINVIEW);
      }
    });
  }

  @override
  void dispose() {
    logic.state.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: slideFromRight(
                controller: logic.state.controller,
                child: Image.asset(
                  'images/paxify.png',
                  height: 100.h,
                  width: 135.w,
                )),
          ),
        ],
      ),
    );
  }
}
