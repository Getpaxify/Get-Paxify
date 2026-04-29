import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:paxify/modules/onboarding/indicator.dart';
import 'package:paxify/modules/onboarding/onboarding_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});
  final logic = Get.find<OnboardingLogic>();
  final state = Get.find<OnboardingLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0XFFD9D9D9),
      body: Obx(() => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                162.0.h.spacingH,
                Expanded(
                  child: PageView.builder(
                      itemCount: state.onboarding.length,
                      controller: logic.controller(),
                      padEnds: false,
                      onPageChanged: (index) => logic.onChanged(index),
                      itemBuilder: (context, index) {
                        return OnboardingWidget(
                          color: state.onboarding[index].color,
                          index: index,
                          image: state.onboarding[index].image,
                          title: state.index.value != index
                              ? ""
                              : state.onboarding[index].title,
                          footer: state.index.value != index
                              ? ""
                              : state.onboarding[index].subtitle,
                          addT: state.onboarding[index].addT,
                        );
                      }),
                ),

                // 70.h.spacingH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Indicator(
                      height: 10.h,
                      width: 10.w,
                      active: primaryColor,
                      length: state.onboarding.length,
                      radius: 5.r,
                      inactive: const Color(0xff90E1F9),
                      index: state.index.value,
                      margin: 5.sp,
                    ),
                    state.index.value == 2
                        ? InkWell(
                            onTap: () {
                              Get.toNamed(Routes.CHOOSEOPTION);
                            },
                            child: Row(
                              children: [
                                CustomText(
                                  text: 'Get Started',
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textColor: primaryColor,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              logic.controller().nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                            },
                            child: Container(
                              height: 46.h,
                              width: 46.w,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  border: Border.all(color: transparent),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Icon(
                                Icons.arrow_forward,
                                color: whiteColor,
                              ),
                            ),
                          ),
                  ],
                ),

                31.0.h.spacingH
              ],
            ),
          )),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? addT;
  final Color? color;
  final String? footer;
  final int index;
  // final Function()? onTap;
  const OnboardingWidget({
    this.image,
    this.addT,
    this.index = 0,
    required this.color,
    required this.footer,
    required this.title,
    // this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 162.0.h.spacingH,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                width: 250.w,
                height: MediaQuery.of(context).size.height * .35,
                image!,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
        index == 1 ? 60.0.h.spacingH : 140.0.spacingH,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          width: 254.h,
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: title,
              style: TextStyle(
                color: blackColor,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
              children: [
                TextSpan(
                  text: addT,
                  style: TextStyle(
                    color: color,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        15.0.h.spacingH,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 1.sp),
          width: 333.sp,
          child: CustomText(
            textAlign: TextAlign.start,
            text: footer,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            textColor: blackColor,
            fontFamily: 'Manrope',
          ),
        ),
        30.0.h.spacingH,
      ],
    );
  }
}
