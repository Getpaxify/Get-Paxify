import 'package:get/get.dart';
import 'package:paxify/modules/onboarding/onboarding_logic.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingLogic());
  }
}
