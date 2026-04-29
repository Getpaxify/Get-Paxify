import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:paxify/modules/bottom_nav/bottom_nav_state.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/modules/setting/setting_state.dart';

class BottomNavLogic extends GetxController {
  final BottomNavState state = BottomNavState();
  void changeTabIndex(int index) {
    if (state.currenIndex.value != index) {
      state.currenIndex.value = index;
    }
  }
  final SettingLogic settingLogic = Get.find<SettingLogic>();

  SettingState get settinState => settingLogic.state;
}
