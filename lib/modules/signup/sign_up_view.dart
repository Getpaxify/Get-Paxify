import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/signup/sign_up_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/helper.dart';
import 'package:paxify/widgets/load.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final logic = Get.find<SignUpLogic>();
  final state = Get.find<SignUpLogic>().state;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBar(
      //   title: '',
      //   circleColor: transparent,
      //   iconColor: blackColor,
      //   backgroundColor: transparent,
      // ),
      body: Obx(() => SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, right: 20.0, left: 20.0),
              child: CustomScrollView(slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: transparent),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderText(
                                text: 'Sign up',
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
                                validaton: ValidatorHelper.email,
                                onChange: (p0) {
                                  logic.fieldFilled();
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
                                    fieldLabel: 'Full Name',
                                    controller: logic.firstName,
                                    validaton: ValidatorHelper.requiredField,
                                    onChange: (p0) {
                                      logic.fieldFilled();
                                    },
                                    obscure: false,
                                  ),
                                  16.h.spacingH,
                                  AuthDropDown(
                                    label: 'Gender',
                                    option: state.selectedGender.value,
                                    onTap: () {
                                      Get.bottomSheet(
                                        Container(
                                          padding: EdgeInsets.all(15.h),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .20,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.r)),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: SizedBox(
                                                    width: 50.w,
                                                    child: const Divider(
                                                      thickness: 1,
                                                      color: blackColor,
                                                    )),
                                              ),
                                              10.0.h.spacingH,
                                              const Center(
                                                child: CustomText(
                                                  text: 'Select Gender',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              15.0.h.spacingH,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    state.gender.length,
                                                    (index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        state.selectedGender
                                                                .value =
                                                            state.gender[index];
                                                        logic.fieldFilled();
                                                        Get.back();
                                                      },
                                                      child: CustomText(
                                                        text:
                                                            state.gender[index],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  16.h.spacingH,
                                  AuthTextField(
                                    fieldLabel: 'Age',
                                    validaton: ValidatorHelper.requiredField,
                                    onChange: (p0) {
                                      logic.fieldFilled();
                                    },
                                    controller: logic.age,
                                    obscure: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                  16.h.spacingH,
                                  AuthTextField(
                                    fieldLabel: 'Phone Number',
                                    validaton: ValidatorHelper.requiredField,
                                    onChange: (p0) {
                                      String formatted = p0;

                                      if (formatted.startsWith('0')) {
                                        formatted = formatted.substring(1);
                                      } else if (formatted.startsWith('234')) {
                                        formatted = formatted.substring(3);
                                      }

                                      if (formatted != p0) {
                                        logic.mobile.text = formatted;
                                        logic.mobile.selection =
                                            TextSelection.fromPosition(
                                          TextPosition(
                                              offset: logic.mobile.text.length),
                                        );
                                      }
                                      logic.fieldFilled();
                                    },
                                    controller: logic.mobile,
                                    obscure: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                  16.h.spacingH,
                                  AuthDropDown(
                                    label: 'Country',
                                    option:
                                        state.selectedCountry.value?.name ?? '',
                                    onTap: () {
                                      Get.bottomSheet(Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .5,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.r))),
                                        child: Obx(() => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: SizedBox(
                                                      width: 50.w,
                                                      child: const Divider(
                                                        thickness: 1,
                                                        color: blackColor,
                                                      )),
                                                ),
                                                10.0.h.spacingH,
                                                const Center(
                                                  child: CustomText(
                                                    text: 'Select Country',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                AuthTextField(
                                                  suffixIcon:
                                                      Icon(Icons.search),
                                                  fieldLabel: '',
                                                  hintTextStyle: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  hintText: 'Search Country',
                                                  onChange: (val) {
                                                    logic.searchList(val);
                                                  },
                                                ),
                                                15.0.h.spacingH,
                                                Expanded(
                                                  child: ListView.builder(
                                                      itemCount: state
                                                          .searchedCountry
                                                          .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  state
                                                                      .selectedCountry
                                                                      .value = state
                                                                          .searchedCountry[
                                                                      index];
                                                                  logic
                                                                      .fieldFilled();
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    CustomText(
                                                                  text: state
                                                                      .searchedCountry[
                                                                          index]
                                                                      .name,
                                                                ),
                                                              ),
                                                              const Divider()
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                )
                                              ],
                                            )),
                                      ));
                                    },
                                  ),
                                  16.h.spacingH,
                                  AuthTextField(
                                    fieldLabel: 'Create Password',
                                    validaton: ValidatorHelper.password,
                                    onChange: (p0) {
                                      logic.fieldFilled();
                                    },
                                    controller: logic.password,
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          if (!state.isObscure.value) {
                                            state.isObscure.value = true;
                                          } else {
                                            state.isObscure.value = false;
                                          }
                                        },
                                        child: Icon(state.isObscure.value ==
                                                false
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined)),
                                    obscureText: state.isObscure.value,
                                  ),
                                  16.h.spacingH,
                                  AuthTextField(
                                    fieldLabel: 'Confirm Password',
                                    onChange: (p0) {
                                      logic.fieldFilled();
                                    },
                                    controller: logic.cpassword,
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          if (!state.isCObscure.value) {
                                            state.isCObscure.value = true;
                                          } else {
                                            state.isCObscure.value = false;
                                          }
                                        },
                                        child: Icon(state.isCObscure.value ==
                                                false
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined)),
                                    obscureText: state.isCObscure.value,
                                  ),
                                  16.h.spacingH,
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
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
                                fontSize: 13.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'privacy policy ',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: 'and ',
                                  style: TextStyle(
                                    color: greyText,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: ' agreed to our terms of service',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
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
                        40.0.h.spacingH,
                        state.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              )
                            : Obx(() => LoadButton(
                                label: 'Continue',
                                color: state.isFilled.value
                                    ? primaryColor
                                    : const Color(0xff6C8F9C),
                                function: () {
                                  if(formKey.currentState!.validate()){
                                        logic.signUp(context);
                                  }

                                })),
                        10.0.h.spacingH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 320.w,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Already have an account?',
                                  style: TextStyle(
                                    color: greyText,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' Sign In',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.sp,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(Routes.SIGNINVIEW);
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 50.h,
            decoration: BoxDecoration(
                border: Border.all(color: fieldGrey),
                borderRadius: BorderRadius.circular(16.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: option!,
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
