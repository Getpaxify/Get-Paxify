import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';

import 'home_logic.dart';

class AllTherapy extends StatelessWidget {
  AllTherapy({super.key});
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        leading:  InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.chevron_left,
            color: blackColor,
          ),
        ),
        title: HeaderText(
          text: 'Explore Therapists',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.filters.map((filter) {
                    bool isFilter =
                        filter == "Filter";
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Chip(
                        label: Row(
                          children: [
                            CustomText(
                              text: filter,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            if (isFilter) const SizedBox(width: 4),
                            if (isFilter)
                              const Icon(Icons.tune, size: 16),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Color(0xff999999)),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Column(
                children: List.generate(4, (index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.sp),
                    padding: EdgeInsets.all(16.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: whiteColor),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'images/top.png',
                              height: 100.h,
                              width: 100.w,
                            ),
                            8.0.w.spacingW,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: '15 happy session',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  textColor: appGreen,
                                ),
                                8.0.h.spacingH,
                                CustomText(
                                  text: 'Sarah Adewale',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: 'M.A in Applied Psychology',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  textColor: fieldGrey,
                                ),
                                8.0.h.spacingH,
                                CustomText(
                                  text: 'Personal Growth . Fear . Anxiety',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  textColor: fieldGrey,
                                ),
                                16.0.h.spacingH,
                                Row(
                                  children: [
                                    Icon(
                                      Icons.chat,
                                      color: appGreen,
                                      size: 8.sp,
                                    ),
                                    CustomText(
                                      text: 'English',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    25.0.w.spacingW,
                                    Icon(
                                      Icons.wallet_outlined,
                                      color: appGreen,
                                      size: 8.sp,
                                    ),
                                    CustomText(
                                      text: '\$20/hr',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        17.0.h.spacingH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 5;i++)
                              Container(
                                  padding: EdgeInsets.all(3.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(color: appGreen)),
                                  child: CustomText(
                                    text: '2:00PM',
                                    fontSize: 8.sp,
                                  )), Icon(Icons.chevron_right, color: appGreen,)
                          ],
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
