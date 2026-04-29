import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:paxify/api/register_api.dart';
import 'package:paxify/modules/choose_option/choose_option_state.dart';
import 'package:paxify/modules/verify_email/verify_email_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/widgets/snackbar.dart';

import '../choose_option/choose_option_logic.dart';

class VerifyEmailLogic extends GetxController {
  final VerifyEmailState state = VerifyEmailState();
  final OtpFieldController controller = OtpFieldController();
  final ChooseOptionLogic optionLogic = Get.find<ChooseOptionLogic>();
  ChooseOptionState get optionState => optionLogic.state;
  final api = Get.put(RegisterApi());
  void addNumber(String number) {
    if (state.pin.value.length < 6) {
      state.pin.value += number;
    }
  }

  void removeNumber() {
    if (state.pin.value.isNotEmpty) {
      state.pin.value =
          state.pin.value.substring(0, state.pin.value.length - 1);
    }
  }

  bool isComplete() => state.pin.value.length == 6;

  Future<void> confirmGmail(BuildContext context, String gmail) async {
    state.isLoading.value = true;
    var req = await api.confirmGmail(state.email, state.pin.value);
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['success'] == 1) {
      AppSnackbar.success(context, message: reqBody['message']);
      Future.delayed(const Duration(milliseconds: 700), () {
        Get.toNamed(Routes.VERIFYEMAIL, arguments: gmail);
      });
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> verifyGmail(BuildContext context, String mail) async {
    state.isLoading1.value = true;

    var req = await api.verifyGmail(mail, state.pin.value);

    var reqBody = req.body;
    state.isLoading1.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
      if (optionState.mode.value.toLowerCase() == 'doctor') {
        Get.toNamed(Routes.UPLOAD);
      } else {
        Get.toNamed(Routes.SIGNINVIEW);
      }
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }
}
