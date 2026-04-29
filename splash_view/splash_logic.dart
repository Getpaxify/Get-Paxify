import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paxify/app_service/local_storage.dart';
import 'package:paxify/modules/splash_view/splash_state.dart';
import 'package:paxify/routes/app_pages.dart';

class SplashLogic extends GetxController {
  late SplashState state;

  SplashLogic({required AnimationController animationController}) {
    state = SplashState(animationController: animationController);
  }
  LocalStorage storage = LocalStorage();
@override
void onInit() {
  super.onInit();
  _init();
}

Future<void> _init() async {
  state.token.value = await storage.getVarable('token') ?? '';
  log('this is:${state.token.value}');

  Future.delayed(const Duration(seconds: 4), () {
    if (state.token.value.isEmpty) {
      Get.toNamed(Routes.ONBOARDING);
    } else {
      Get.toNamed(Routes.SIGNINVIEW);
    }
  });
}

  void navigateToNextPage() async{
    state.token.value = await storage.getVarable('token') ?? '';


    Future.delayed(const Duration(seconds: 4), () {
      // if (state.token.value.isEmpty) {
      //   Get.toNamed(Routes.ONBOARDING);
      // } else {
        Get.toNamed(Routes.SIGNINVIEW);
      // }
    });
  }
}
