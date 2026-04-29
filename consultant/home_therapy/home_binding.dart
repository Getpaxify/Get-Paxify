import 'package:get/get.dart';
import 'package:paxify/modules/consultant/home_therapy/home_logic.dart';

class ConsultantHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConsultantHomeLogic());
  }
}
