import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/assessment/achieve_view.dart';
import 'package:paxify/modules/setting/setting.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/helper.dart';
import 'package:paxify/widgets/load.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const HeaderText(
          text: "Change password",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          textColor: appBlack,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
        child: Obx(() => Form(
              key: state.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Section
                    CustomText(
                      text:
                          'Please enter your current password to change your password',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    24.0.h.spacingH,
                    AuthTextField(
                      fieldLabel: 'Current Password',
                      controller: logic.currentPassController,
                      validaton: ValidatorHelper.password,
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (!state.isCurrentVisibility.value) {
                              state.isCurrentVisibility.value = true;
                            } else {
                              state.isCurrentVisibility.value = false;
                            }
                          },
                          icon: Icon(state.isCurrentVisibility.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined)),
                      obscure: state.isCurrentVisibility.value,
                    ),
                    16.0.h.spacingH,
                    AuthTextField(
                      fieldLabel: 'New Password',
                      validaton: ValidatorHelper.password,
                      controller: logic.newPassController,
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (!state.isNewVisibility.value) {
                              state.isNewVisibility.value = true;
                            } else {
                              state.isNewVisibility.value = false;
                            }
                          },
                          icon: Icon(state.isNewVisibility.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined)),
                      obscure: state.isNewVisibility.value,
                    ),
                    16.0.h.spacingH,
                    AuthTextField(
                      fieldLabel: 'Confirm Password',
                      controller: logic.confirmPassController,
                      validaton: (val) {
                        if (logic.newPassController.text !=
                            logic.confirmPassController.text) {
                          return 'Password do not match';
                        } else {
                          return null;
                        }
                      },
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (!state.isConfVisibility.value) {
                              state.isConfVisibility.value = true;
                            } else {
                              state.isConfVisibility.value = false;
                            }
                          },
                          icon: Icon(state.isConfVisibility.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined)),
                      obscure: state.isConfVisibility.value,
                    ),
                    50.0.h.spacingH,
                    state.isUpLoading.value
                        ? CircularProgressIndicator()
                        : LoadButton(
                            label: 'Update Password',
                            function: () {
                              if (state.formKey.currentState!.validate()) {
                                logic.changePassword(
                                    context,
                                    logic.currentPassController.text,
                                    logic.newPassController.text);
                              }
                              ;
                            })
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
