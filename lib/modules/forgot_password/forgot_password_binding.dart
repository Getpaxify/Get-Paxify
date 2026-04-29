import 'package:get/get.dart';
import 'package:paxify/modules/forgot_password/forgot_password_logic.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordLogic());
  }
}
