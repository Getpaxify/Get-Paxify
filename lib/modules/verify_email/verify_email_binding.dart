import 'package:get/get.dart';
import 'package:paxify/modules/verify_email/verify_email_logic.dart';

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyEmailLogic());
  }
}
