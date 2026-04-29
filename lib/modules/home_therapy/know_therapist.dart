import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/model/get_doctor_model.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';
import '../../theme/app_colors.dart';

class KnowTherapist extends StatelessWidget {
  const KnowTherapist({super.key});

  @override
  Widget build(BuildContext context) {
    GetDoctorData doctor = Get.arguments;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: InkWell(
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
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              doctor.profileImage == null
                  ? Container(
                      height: deviceSize.height * .4,
                      width: deviceSize.width * .8,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: const Icon(
                        Icons.broken_image,
                        size: 50,
                        color: whiteColor,
                      ),
                    )
                  : Image.network(
                      doctor.profileImage,
                      height: deviceSize.height * .4,
                      width: deviceSize.width * .8,
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
              16.0.h.spacingH,
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        children: List.generate(doctor.specializations.length,
                            (index) {
                          return CustomText(
                            text: '${doctor.specializations[index]}, ',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            textColor: fieldGrey,
                          );
                        }),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: yellow,
                            size: 16.sp,
                          ),
                          10.0.w.spacingW,
                          CustomText(
                            text: doctor.averageRating,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            textColor: fieldGrey,
                          ),
                          10.0.w.spacingW,
                          CustomText(
                            text: '${doctor.totalReviews.toString()} reviews',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            textColor: fieldGrey,
                          ),
                        ],
                      ),
                      30.0.h.spacingH,
                      CustomText(
                        text: '${doctor.numberOfSessions} Happy Sessions',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        textColor: appGreen,
                      ),
                    ],
                  ),
                ],
              ),
              15.0.h.spacingH,
              CustomText(
                text:
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, ',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              16.0.h.spacingH,
              Image.asset('images/you.png'),
              40.0.h.spacingH,
              LoadButton(
                  label: 'Book a session',
                  function: () {
                    Get.toNamed(Routes.THERAPIST,arguments: doctor);
                  }),
              16.0.h.spacingH,
            ],
          ),
        ),
      ),
    );
  }
}
