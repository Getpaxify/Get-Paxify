import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paxify/model/get_doctor_model.dart';
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

Widget buildUpcoming(String? name, String? age, String? image, String? speciality) {
  return Container(
    padding: EdgeInsets.all(16.sp),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xffF0F0F0)),
    child: Row(
      children: [
        Image.network(
          image??'',
          height: 50.h,
          width: 50.w,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.person,size: 45.sp,),
        ),
        8.0.w.spacingW,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: name,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            Row(
              children: [
                // CustomText(
                //   text: '25yrs old',
                //   fontSize: 10.sp,
                //   fontWeight: FontWeight.w400,
                //   textColor: blackColor,
                // ),
                // 12.0.w.spacingW,
                CustomText(
                  text: speciality??'Not available',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  textColor: blackColor,
                ),
                // 12.0.w.spacingW,
                // CustomText(
                //   text: 'On Meds',
                //   fontSize: 10.sp,
                //   fontWeight: FontWeight.w400,
                //   textColor: blackColor,
                // ),
              ],
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
        // Spacer(),
        // Row(
        //   children: [
        //     Icon(
        //       Icons.star_border,
        //       color: yellow,
        //       size: 16.sp,
        //     ),
        //     10.0.w.spacingW,
        //     CustomText(
        //       text: '4.8',
        //       fontSize: 10.sp,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ],
        // )
      ],
    ),
  );
}

Widget buildTopTherapist(GetDoctorData doctor) {
  return Padding(
    padding: const EdgeInsets.only(bottom:16.0),
    child: Row(
      children: [
        doctor.profileImage == null
            ? Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: whiteColor,
                ),
              )
            : ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                  doctor.profileImage,
                  height: 100.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: SizedBox(
                        height: 30.h,
                        width: 30.h,
                        child: const CircularProgressIndicator(
                          color: whiteColor,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, url, error) =>
                      const Icon(Icons.broken_image),
                ),
            ),
        8.0.w.spacingW,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: doctor.numberOfSessions.toString(),
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              textColor: appGreen,
            ),
            8.0.h.spacingH,
            CustomText(
              text: doctor.fullName,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            CustomText(
              text: doctor.licence??'Not Available',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              textColor: fieldGrey,
            ),
            8.0.h.spacingH,
            if(doctor.specializations.isEmpty)
                   CustomText(
                  text: 'Not specified at the moment ',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  textColor: fieldGrey,
                )
                 else
            Wrap(
              children: List.generate(doctor.specializations.length, (index) {
                
                return CustomText(
                  text: '${doctor.specializations[index]}, ',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  textColor: fieldGrey,
                );
              }),
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
                  text: doctor.country,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
                // 25.0.w.spacingW,
                // Icon(
                //   Icons.wallet_outlined,
                //   color: appGreen,
                //   size: 8.sp,
                // ),
                // CustomText(
                //   text: '\$${doctor.c}',
                //   fontSize: 10.sp,
                //   fontWeight: FontWeight.w400,
                // ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

Widget buildDailyHabit(String image, String title,String body) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        image,
        height: 120.h,
        width: 160.w,
        fit: BoxFit.cover,
      ),
      12.0.h.spacingH,
      SizedBox(
                height: 70.h,
                width: 200.w,
        child: HeaderText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
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
