import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


import 'onboarding_state.dart';

class OnboardingLogic extends GetxController {
  final OnboardingState state = OnboardingState();
  late final PageController _pageController;

  @override
  void onInit() {
    super.onInit();
    _pageController = PageController(viewportFraction: 0.8, initialPage: state.index.value);
  }

  PageController controller() => _pageController;

  void onChanged(int index) {
    state.index.value = index;
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }
}



// class OnboardingLogic extends GetxController {
//   final OnboardingState state = OnboardingState();

//   @override
//   void onInit() {
//     super.onInit();
//     Future.delayed(Duration(seconds: 2), () {
//       // Get.toNamed(Routes.LOGIN);
//     });
//   }

//   void onChanged(int index) {
//     index = state.index.value;
//   }

//  late final PageController? _controller;

//   PageController controller() {
//     _controller = PageController(initialPage: state.index.value);
//     return _controller!;
//   }

//   @override
//   void onClose() {


//     super.onClose();
//   }
// }
