import 'package:get/get.dart';
import 'package:paxify/modules/consultant/upload/upload_logic.dart';

class UploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadLogic());
  }
}
