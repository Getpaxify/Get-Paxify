import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/app_bar.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

import 'forgot_password_logic.dart';

class ForgotPasswordView extends StatelessWidget {
  final logic = Get.find<ForgotPasswordLogic>();
  final state = Get.find<ForgotPasswordLogic>().state;
  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
        child: Obx(() => Column(
              children: [
                CustomText(
                  text:
                      'Enter your email address below, and we’ll send you a link to reset your password. If you don’t receive an email within a few minutes, please check your spam folder.',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                24.0.h.spacingH,
                 AuthTextField(fieldLabel: 'Email',controller: logic.email,),
                60.0.h.spacingH,
                state.isLoading.value
                    ? const Center(
                        child: const CircularProgressIndicator(
                        color: primaryColor,
                      ))
                    : LoadButton(
                        label: 'Update Password',
                        function: () {
                          logic.forgotPassword(context);
                        })
              ],
            )),
      ),
    );
  }
}
