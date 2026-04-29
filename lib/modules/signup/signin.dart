import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/choose_option/choose_option_state.dart';
import 'package:paxify/modules/signup/sign_up_logic.dart';
import 'package:paxify/modules/signup/sign_up_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/app_bar.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  final logic = Get.find<SignUpLogic>();
  final state = Get.find<SignUpLogic>().state;
  final userNature = Get.put(ChooseOptionState());
  @override
  Widget build(BuildContext context) {
    var proceedWith = Get.arguments;
    return Scaffold(
      body: Obx(() => SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, right: 20.0, left: 20.0),
              child: CustomScrollView(slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: transparent),
                          child: proceedWith == Hmo.hmo
                              ? buildHMOView(context, logic, state)
                              : proceedWith == Hmo.corporate
                                  ? buildCorporateView(context, logic, state)
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        HeaderText(
                                          text: 'Sign In',
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        16.0.h.spacingH,
                                        CustomText(
                                          text: 'Glad to have you here',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),

                                        24.0.h.spacingH,
                                        AuthTextField(
                                          fieldLabel: 'Email Address',
                                          controller: logic.email,
                                          onChange: (p0) {
                                            logic.isLoginFilled();
                                          },
                                          obscure: false,
                                        ),
                                        // state.selectedIndex.value != 0
                                        //     ? 60.0.h.spacingH
                                        //     : 20.h.spacingH,
                                        // state.selectedIndex.value == 0
                                        //     ?
                                        16.0.h.spacingH,
                                        Column(
                                          children: [
                                            AuthTextField(
                                              fieldLabel: 'Password',
                                              onChange: (p0) {
                                                logic.isLoginFilled();
                                              },
                                              controller: logic.password,
                                              suffixIcon: InkWell(
                                                  onTap: () {
                                                    if (!state
                                                        .isObscure.value) {
                                                      state.isObscure.value =
                                                          true;
                                                    } else {
                                                      state.isObscure.value =
                                                          false;
                                                    }
                                                  },
                                                  child: Icon(state.isObscure
                                                              .value ==
                                                          false
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined)),
                                              obscure: state.isObscure.value,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        Routes.FORGOTPAASWORD);
                                                  },
                                                  child: CustomText(
                                                    text: 'Forgot Password',
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            16.h.spacingH,
                                          ],
                                        )
                                      ],
                                    ),
                        ),
                        proceedWith == Hmo.hmo || proceedWith == Hmo.corporate
                            ? const SizedBox.shrink()
                            : SizedBox(
                                width: 320.w,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text:
                                        'By tapping ‘Continue’, you confirm that you have read our ',
                                    style: TextStyle(
                                      color: greyText,
                                      fontFamily: 'privacy policy ',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'privacy policy ',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'and ',
                                        style: TextStyle(
                                          color: greyText,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' agreed to our terms of service',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Get.toNamed(Routes.LOGINVIEW);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        proceedWith == Hmo.hmo || proceedWith == Hmo.corporate
                            ? const SizedBox.shrink()
                            : 40.0.h.spacingH,
                        proceedWith == Hmo.hmo || proceedWith == Hmo.corporate
                            ? const SizedBox.shrink()
                            : state.isLoading.value
                                ? CircularProgressIndicator(
                                    color: primaryColor,
                                  )
                                : Row(
                                    children: [
                                      Flexible(
                                        child: LoadButton(
                                            label: 'Continue',
                                            color: state.isLoginFilled.value
                                                ? primaryColor
                                                : const Color(0xff6C8F9C),
                                            function: state.isLoginFilled.value
                                                ? () {
                                                    logic.signIn(context);
                                                  }
                                                : () {}),
                                      ),
                                      state.isBiometric.value
                                          ? Row(
                                              children: [
                                                15.0.w.spacingW,
                                                InkWell(
                                                  onTap: () {
                                                    logic.loginWithBiometric(
                                                        context);
                                                  },
                                                  child: Image.asset(
                                                    'images/biometric.png',
                                                    height: 50.h,
                                                    width: 50.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SizedBox.shrink()
                                    ],
                                  ),
                        10.0.h.spacingH,
                        proceedWith == Hmo.hmo || proceedWith == Hmo.corporate
                            ? const SizedBox.shrink()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 320.w,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'Don\'t have an account?',
                                        style: TextStyle(
                                          color: greyText,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' Sign Up',
                                            style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13.sp,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Get.toNamed(
                                                    Routes.CHOOSEOPTION);
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}

class AuthDropDown extends StatelessWidget {
  final String? label;
  final String? option;
  final Function()? onTap;
  const AuthDropDown(
      {super.key,
      required this.label,
      required this.onTap,
      required this.option});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: label!,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          8.0.h.spacingH,
          Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                border: Border.all(color: fieldGrey),
                borderRadius: BorderRadius.circular(16.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomText(
                    text: option!,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildHMOView(
    BuildContext context, SignUpLogic logic, SignUpState state) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(
              text: 'Sign In',
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
            16.0.h.spacingH,
            CustomText(
              text: 'Kindly select your HMO and input your HMO enrolee ID',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            24.0.h.spacingH,
            AuthDropDown(
                label: 'HMO',
                onTap: () {
                  Get.bottomSheet(Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.r))),
                  ));
                },
                option: ''),
            16.0.h.spacingH,
            Column(
              children: [
                AuthTextField(
                  fieldLabel: 'Enrolee ID',
                  onChange: (p0) {
                    logic.fieldFilled();
                  },
                  controller: logic.lastName,
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
              ],
            )
          ],
        ),
      ),
      40.0.h.spacingH,
      LoadButton(
          label: 'Continue',
          color: state.isFilled.value ? primaryColor : const Color(0xff6C8F9C),
          function: () {
            Get.toNamed(Routes.ASSESSMENT);
          }),
      10.0.h.spacingH,
    ],
  );
}

Widget buildCorporateView(
    BuildContext context, SignUpLogic logic, SignUpState state) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(
              text: 'Sign In',
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
            16.0.h.spacingH,
            CustomText(
              text:
                  'Kindly select your Corporate organization, Your company registered HMO and input your HMO enrolee ID ',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            24.0.h.spacingH,
            AuthDropDown(
                label: 'Corporate Firm/Organization',
                onTap: () {
                  Get.bottomSheet(Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.r))),
                  ));
                },
                option: ''),
            24.0.h.spacingH,
            AuthDropDown(
                label: 'HMO',
                onTap: () {
                  Get.bottomSheet(Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.r))),
                  ));
                },
                option: ''),
            16.0.h.spacingH,
            Column(
              children: [
                AuthTextField(
                  fieldLabel: 'Enrolee ID',
                  onChange: (p0) {
                    logic.fieldFilled();
                  },
                  controller: logic.lastName,
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
              ],
            )
          ],
        ),
      ),
      40.0.h.spacingH,
      LoadButton(
          label: 'Continue',
          color: state.isFilled.value ? primaryColor : const Color(0xff6C8F9C),
          function: () {
            Get.toNamed(Routes.ASSESSMENT);
          }),
      10.0.h.spacingH,
    ],
  );
}
