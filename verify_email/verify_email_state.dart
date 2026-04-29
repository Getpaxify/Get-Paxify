import 'package:get/get.dart';

class VerifyEmailState {
  VerifyEmailState();
  var pin = ''.obs;
    var email = Get.arguments;
  // Observable for the PIN

  RxBool isConfirm = false.obs;
  RxBool isLoading = false.obs;
    RxBool isLoading1 = false.obs;
}
