import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:paxify/modules/choose_option/choose_option_logic.dart';

class ChooseOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseOptionLogic());
  }
}
