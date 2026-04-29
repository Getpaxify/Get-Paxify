import 'package:get/get.dart';
import 'package:paxify/modules/setting/setting_logic.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingLogic());
  }
}
