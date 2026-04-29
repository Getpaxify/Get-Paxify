import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:paxify/modules/assessment/assessment_logic.dart';

class AssesstmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssessmentLogic());
  }
}
