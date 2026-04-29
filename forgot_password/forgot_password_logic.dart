import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paxify/api/register_api.dart';
import 'package:paxify/modules/forgot_password/forgot_password_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/widgets/snackbar.dart';

class ForgotPasswordLogic extends GetxController {
  ForgotPasswordState state = ForgotPasswordState();
  final api = Get.put(RegisterApi());
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController token = TextEditingController();
  Future<void> forgotPassword(BuildContext context) async {
    state.isLoading.value = true;
    var req = await api.forgotPassword(email.text);
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
      Get.toNamed(Routes.RESETPASSWORD);
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> resetPassword(BuildContext context, ) async {
    state.isLoading.value = true;
    var req = await api.resetPassword(password.text,token.text);
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
      Get.toNamed(Routes.SIGNINVIEW);
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }
}
