import 'package:get/get.dart';
import 'package:paxify/modules/home_therapy/home_logic.dart';

class PlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
  }
}
