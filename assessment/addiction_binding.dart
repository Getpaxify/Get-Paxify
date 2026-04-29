import 'package:get/get.dart';
import 'package:paxify/modules/assessment/assessment_logic.dart';

class AddictionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssessmentLogic());
  }
}
