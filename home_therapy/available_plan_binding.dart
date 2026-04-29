import 'package:get/get.dart';
import 'package:paxify/modules/home_therapy/home_binding.dart';
import 'package:paxify/modules/home_therapy/home_logic.dart';

class AvailablePlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
  }
}
