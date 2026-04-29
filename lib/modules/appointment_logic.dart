import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:paxify/modules/appointment/appointment_logic.dart';

class AppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentLogic());
  }
}
