import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:paxify/api/assessment_api.dart';
import 'package:paxify/app_service/local_storage.dart';
import 'package:paxify/model/assessment_category_model.dart';
import 'package:paxify/modules/assessment/assessment_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';
import 'package:paxify/widgets/snackbar.dart';

class AssessmentLogic extends GetxController {
  AssessmentState state = AssessmentState();
  AssessmentApi api = Get.put(AssessmentApi());
  TextEditingController noteController = TextEditingController();
  LocalStorage storage = LocalStorage();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getAssessmentCategory(Get.context!);
  }

  void selectCause(Map<String, String> cause) {
    if (state.selectedCauses.contains(cause)) {
      state.selectedCauses.remove(cause);
    } else {
      state.selectedCauses.add(cause);
    }
  }

  void selectAddiction(String addiction) {
    if (state.selectedAddiction.contains(addiction)) {
      state.selectedAddiction.remove(addiction);
    } else {
      state.selectedAddiction.add(addiction);
    }
  }

  void setIntensity() {
    if (state.sliderValue.value <= 33) {
      state.intensity.value = 'Slightly';
    } else if (state.sliderValue.value >= 33.1 &&
        state.sliderValue.value <= 66.6) {
      state.intensity.value = 'Fairly';
    } else if (state.sliderValue.value >= 66.6 &&
        state.sliderValue.value <= 95) {
      state.intensity.value = 'Very';
    } else {
      state.intensity.value = 'Extremely';
    }
  }

  void selectAchievement(String achievementSelected) {
    if (state.achieve.contains(achievementSelected)) {
      state.achieve.removeWhere((item) => item == achievementSelected);
    } else {
      state.achieve.add(achievementSelected);
    }
  }

  Future<void> getAssessmentCategory(BuildContext context) async {
    state.isLoading.value = true;
    final req = await api.getAssessment();
    state.isLoading.value = false;
    final reqBody = req.body;
    if (reqBody['status'] == 200) {
      state.allAssessment.value = List<AssessmentCategory>.from(
          reqBody['data'].map((x) => AssessmentCategory.fromJson(x)));

      log('all is ${state.allAssessment.length}');
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> createAssessment(BuildContext context) async {
    state.isLoading.value = true;
    var req = await api.createAssessment(state.selectedAddiction,
        state.intensity.value, noteController.text, state.selectedCauses);
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['status'] == 201) {
      AppSnackbar.success(context, message: reqBody['message']);
     await storage.saveBoolVariable('isFilledAssessment', true);
      getDialog();
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  void getDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '🔥', // Fire emoji
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Way To Go! ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: appBlack,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Nunito Sans',
                      ),
                    ),
                    TextSpan(
                      text: '0-Day Journaling Streak Unlocked!',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Nunito Sans',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              CustomText(
                text:
                    'Supercharged your mental wellness - talk to a therapist for expert support',
                fontSize: 14.sp,
                textColor: fieldGrey,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                fontFamily: 'Nunito Sans',
              ),
              const SizedBox(height: 20),
              LoadButton(
                label: 'Proceed to dashboard',
                function: () {
                  Get.toNamed(Routes.STARTTHERAPY);
                },
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveAssessmentFilled() async {}
  void onRefresh() async {
    if (state.reloadTime.value <= 10) {
      getAssessmentCategory(Get.context!);
    }
    // refreshController.refreshCompleted();
  }

  void onLoading() async {
    if (!isClosed) {
      state.reloadTime.value++;
    }
  }
}
