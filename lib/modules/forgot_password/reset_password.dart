import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/forgot_password/forgot_password_logic.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/app_bar.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

class ResetPasswordView extends StatelessWidget {
  final logic = Get.find<ForgotPasswordLogic>();
  final state = Get.find<ForgotPasswordLogic>().state;
  ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
        child: Obx(() => SingleChildScrollView(
          child: Column(
                children: [
                  CustomText(
                    text:
                        'Create a strong password for your account. Make sure it\'s at least 8 characters long and includes a mix of letters, numbers, and symbols for security.',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  24.0.h.spacingH,
                  AuthTextField(
                    fieldLabel: 'Token',
                    controller: logic.token,
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [LengthLimitingTextInputFormatter(6)],
                  ),
                  16.0.h.spacingH,
                  AuthTextField(
                    fieldLabel: 'New Password',
                    controller: logic.password,
                    suffixIcon: InkWell(
                        onTap: () {
                          if (!state.isObscure.value) {
                            state.isObscure.value = true;
                          } else {
                            state.isObscure.value = false;
                          }
                        },
                        child: Icon(state.isObscure.value == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined)),
                    obscure: state.isObscure.value,
                  ),
                  16.h.spacingH,
                  AuthTextField(
                    fieldLabel: 'Confirm New Password',
                    controller: logic.cpassword,
                    suffixIcon: InkWell(
                        onTap: () {
                          if (!state.isCObscure.value) {
                            state.isCObscure.value = true;
                          } else {
                            state.isCObscure.value = false;
                          }
                        },
                        child: Icon(state.isCObscure.value == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined)),
                    obscure: state.isCObscure.value,
                  ),
                  60.0.h.spacingH,
                  state.isLoading.value? Center(
                    child: CircularProgressIndicator(color: primaryColor,)
                  ):
                  LoadButton(
                      label: 'Update Password',
                      function: () {
                        logic.resetPassword(context);
                      })
                ],
              ),
        )),
      ),
    );
  }
}
