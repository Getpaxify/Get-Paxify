import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/verify_email/verify_email_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/app_bar.dart';
import 'package:paxify/widgets/custom_text.dart';

class VerifyEmailView extends StatelessWidget {
  VerifyEmailView({super.key});
  final logic = Get.find<VerifyEmailLogic>();
  final state = Get.find<VerifyEmailLogic>().state;
  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () => logic.addNumber(number),
      child: Container(
        height: 59.h,
        width: 100.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            // border: Border.all(color: const Color(0xffDCDCDC)),
            borderRadius: BorderRadius.circular(4.r),
            color: whiteColor),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return GestureDetector(
      onTap: logic.removeNumber,
      child: Container(
        height: 59.h,
        width: 100.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            // border: Border.all(color: const Color(0xffDCDCDC)),
            borderRadius: BorderRadius.circular(4.r),
            color: whiteColor),
        child: const Icon(Icons.backspace_outlined, size: 24),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context, String gmail) {
    return  GestureDetector(
          onTap: state.pin.value.length < 6
              ? () {
                  Get.snackbar(
                      backgroundColor: appRed,
                      colorText: whiteColor,
                      'Error',
                      'Ensure to fill all the fields');
                }
              : () {
                  // state.isConfirm.value = true;
                  logic.verifyGmail(context,gmail);
                },
          child: Container(
            height: 59.h,
            width: 100.h,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                // border: Border.all(color: const Color(0xffDCDCDC)),
                borderRadius: BorderRadius.circular(4.r),
                color: state.pin.value.length < 6
                    ? primaryColor.withOpacity(0.6)
                    : primaryColor),
            child: state.isLoading1.value
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.check,
                    size: 24,
                    color: whiteColor,
                  ),
          ),
        );
  }

  Widget _buildDots() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          // Check if index corresponds to an entered number
          final isNumberEntered = index < state.pin.value.length;
          return Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              border: Border.all(
                  color: index > state.pin.value.length
                      ? transparent
                      : primaryColor),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Center(
              child: Text(
                isNumberEntered
                    ? state.pin.value[index] // Display the number
                    : '', // Placeholder for empty slots
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    String gmail =Get.arguments;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(
        circleColor: transparent,
        backgroundColor: transparent,
        title: '',
      ),
      body: Obx(() => Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .95,
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.sp, vertical: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0XFFFDFDFD),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '6 Digit Code',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                          5.0.h.spacingH,
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text:
                                    'Code sent to $gmail check inbox or spam folder.',
                                style: TextStyle(
                                  color: greyText,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Edit',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  )
                                ]),
                          ),
                          19.0.h.spacingH,
                          _buildDots(),
                          16.0.h.spacingH,
                          Row(
                            children: [
                              CustomText(
                                text: 'Switch verification method',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                textColor: greyText,
                              ),
                              8.0.w.spacingW,
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: blackColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .21,
                          ),
                          Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: '',
                                style: TextStyle(
                                  color: blackColor,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Already have an Account? Log in',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'Poppins',
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
                    ),
                    // const Spacer(),
                    // LoadButton(
                    //     label: "Verify",
                    //     function: () {
                    //       Get.toNamed(Routes.CREATEPINVIEW);
                    //     })
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .98,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xffF7F7F7),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 40.0.h.spacingH,
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 12, // Numbers + Backspace
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 100.w / 59.h),
                            itemBuilder: (context, index) {
                              if (index < 9) {
                                return _buildNumberButton('${index + 1}');
                              } else if (index == 10) {
                                return _buildNumberButton('0');
                              } else if (index == 9) {
                                return _buildBackspaceButton();
                              } else if (index == 11) {
                                return _buildNextButton(context, gmail);
                              }
                              return const SizedBox.shrink();
                            },
                          )),
                    ]),
              )
            ],
          )),
    );
  }
}
