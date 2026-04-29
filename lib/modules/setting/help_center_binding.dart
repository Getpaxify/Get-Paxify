import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:paxify/modules/appointment/appointment_logic.dart';
import 'package:paxify/modules/setting/setting_logic.dart';

class HelpCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingLogic());
  }
}
