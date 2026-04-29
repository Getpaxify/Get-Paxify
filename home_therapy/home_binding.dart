import 'package:get/get.dart';
import 'package:paxify/modules/consultant/upload/upload_logic.dart';
import 'package:paxify/modules/home_therapy/home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => UploadLogic());
    
  }
}
