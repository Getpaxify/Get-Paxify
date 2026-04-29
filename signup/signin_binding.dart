import 'package:get/get.dart';
import 'package:paxify/modules/choose_option/choose_option_logic.dart';
import 'package:paxify/modules/signup/sign_up_logic.dart';


class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpLogic());
    Get.lazyPut(() => ChooseOptionLogic());
  }
}
