import 'package:get/get.dart';
import 'package:paxify/modules/appointment/call/call_logic.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallLogic());
  }
}
