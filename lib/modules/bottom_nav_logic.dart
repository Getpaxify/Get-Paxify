import 'package:get/get.dart';
import 'package:paxify/modules/appointment/appointment_logic.dart';
import 'package:paxify/modules/bottom_nav/bottom_nav_logic.dart';
import 'package:paxify/modules/consultant/home_therapy/home_logic.dart';
import 'package:paxify/modules/home_therapy/home_logic.dart';
import 'package:paxify/modules/setting/setting_logic.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavLogic());
    Get.lazyPut(() => HomeLogic());
     Get.lazyPut(() => AppointmentLogic());
     Get.lazyPut(() => ConsultantHomeLogic());
    Get.lazyPut(() => SettingLogic());
  }
}
