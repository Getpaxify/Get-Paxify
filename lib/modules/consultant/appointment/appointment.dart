import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paxify/modules/appointment/appointment_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

import '../../theme/app_colors.dart';

class Appointment extends StatelessWidget {
  Appointment({super.key});
  final logic = Get.find<AppointmentLogic>();
  final state = Get.find<AppointmentLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        // leading: InkWell(
        //   onTap: () {
        //     Get.back();
        //   },
        //   child: const Icon(
        //     Icons.chevron_left,
        //     color: blackColor,
        //   ),
        // ),
        title: HeaderText(
          text: 'Appointment details',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 24.0, bottom: 2, right: 24.0, left: 24.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  HeaderText(
                    text: 'About Therapist',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              10.0.h.spacingH,
              Image.asset(
                'images/known.png',
                height: 180.h,
                width: 150.w,
              ),
              16.0.h.spacingH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: state.stats.map((stat) {
                  return Column(
                    children: [
                      Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1C4E58), // Dark teal background
                          shape: BoxShape.circle,
                        ),
                        child:
                            Icon(stat["icon"], color: Colors.white, size: 24.w),
                      ),
                      SizedBox(height: 8.h),
                      HeaderText(
                        text: stat["value"],
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Nunito Sans',
                      ),
                      12.0.h.spacingH,
                      CustomText(
                        text: stat["label"],
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        textColor: fieldGrey,
                      ),
                    ],
                  );
                }).toList(),
              ),
              16.0.h.spacingH,
              Row(
                children: [
                  HeaderText(
                    text: 'Appointment Details',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              16.0.h.spacingH,
              buildDetails('Appointment Type:', ' Pay as you go'),
              16.0.h.spacingH,
              buildDetails('Appointment Date:', ' 13-01-2025'),
              16.0.h.spacingH,
              buildDetails('Appointment Time:', ' 09:30AM'),
              16.0.h.spacingH,
              buildDetails('Meeting Type:', ' Voice call'),

              // 16.0.h.spacingH,
              // buildType(
              //   Icons.phone_outlined, 'Voice call', '#2,320'),
              // 16.0.h.spacingH,
              // buildType(Icons.videocam_outlined, 'Video call', '#4,320'),
              60.0.h.spacingH,
              LoadButton(
                  label: 'Start Voice Call (7:00 - 8:00pm)',
                  function: () {
                    Get.toNamed(Routes.CALL);
                  }),
              16.0.h.spacingH,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.CHART);
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: primaryColor),
                      child: Icon(
                        Icons.message,
                        color: whiteColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildDetails(String detail, String value) {
  return Row(
    children: [
      CustomText(
        text: detail,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        textColor: Color(0xff888888),
      ),
      CustomText(
        text: value,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        textColor: appBlack,
      ),
    ],
  );
}
