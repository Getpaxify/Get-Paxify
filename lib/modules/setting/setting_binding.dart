import 'package:get/get.dart';
import 'package:paxify/modules/setting/setting_logic.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingLogic());
  }
}
