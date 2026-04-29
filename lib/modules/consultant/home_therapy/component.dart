import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';

class TagItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TagItem({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 22.w),
      decoration: BoxDecoration(
        color: isSelected ? appGreen : appGreen.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: CustomText(
        text: text,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        textColor: whiteColor,
      ),
    );
  }
}

Widget buildUpcoming() {
  return Container(
    padding: EdgeInsets.all(16.sp),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r), color: Color(0xffF0F0F0)),
    child: Row(
      children: [
        Image.asset(
          'images/up.png',
          height: 50.h,
          width: 50.w,
        ),
        8.0.w.spacingW,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            16.0.h.spacingH,
            Row(
              children: [
                Icon(
                  Icons.alarm,
                  color: blackColor,
                  size: 16.sp,
                ),
                8.0.w.spacingW,
                CustomText(
                  text: 'sept 25th, 2024',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
                12.0.w.spacingW,
                CustomText(
                  text: '7:00-8:00PM',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            )
          ],
        ),
        Spacer(),
        Row(
          children: [
            Icon(
              Icons.star_border,
              color: yellow,
              size: 16.sp,
            ),
            10.0.w.spacingW,
            CustomText(
              text: '4.8',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        )
      ],
    ),
  );
}

Widget buildTopTherapist() {
  return Container(
    padding: EdgeInsets.all(16.sp),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r), color: transparent),
    child: Row(
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
  );
}

Widget buildDailyHabit() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        'images/daily.png',
        height: 120.h,
        width: 160.w,
      ),
      12.0.h.spacingH,
      HeaderText(
        text: 'Avoiding mistakes',
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      4.0.h.spacingH,
      HeaderText(
        text: 'Self Help . 2mins read',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    ],
  );
}
