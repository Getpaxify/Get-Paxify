import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/home_therapy/component.dart';
import 'package:paxify/modules/home_therapy/home_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: logic.scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              expandedHeight: 180.h,
              floating: false,
              pinned: false,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/Frame 37995.png',
                      fit: BoxFit.cover,
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Obx(() => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.0.h.spacingH,
                                Row(
                                  children: [
                                    logic.settinState.profileInformation.value
                                                ?.profileImage ==
                                            null
                                        ? const Icon(
                                            Icons.image,
                                            color: whiteColor,
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            child: Image.network(
                                              logic
                                                      .settinState
                                                      .profileInformation
                                                      .value
                                                      ?.profileImage ??
                                                  '',
                                              height: 70,
                                              width: 60,
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child: SizedBox(
                                                    height: 30.h,
                                                    width: 30.h,
                                                    child:
                                                        const CircularProgressIndicator(
                                                      color: whiteColor,
                                                    ),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (context, url,
                                                      error) =>
                                                  const Icon(
                                                      Icons.broken_image),
                                            ),
                                          ),
                                    8.0.spacingW,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'Hello, Welcome;',
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          textColor: Colors.white,
                                        ),
                                        logic.settinState.isLoading.value
                                            ? SizedBox(
                                                height: 30.h,
                                                width: 30.w,
                                                child:
                                                    const CircularProgressIndicator(
                                                  color: whiteColor,
                                                ),
                                              )
                                            : CustomText(
                                                text: logic
                                                        .settinState
                                                        .profileInformation
                                                        .value
                                                        ?.fullName ??
                                                    '',
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                textColor: Colors.white,
                                                fontFamily: 'Nunito Sans',
                                              ),
                                        // Row(
                                        //   children: [
                                        //     CustomText(
                                        //       text: logic
                                        //               .settinState
                                        //               .profileInformation
                                        //               .value
                                        //               ?.wallet?.balance.toString() ?? '0.00',
                                        //       fontSize: 15.sp,
                                        //       fontWeight: FontWeight.w500,
                                        //       textColor: Colors.white,
                                        //     ),
                                        //     CustomText(
                                        //       text: '  Top-up',
                                        //       fontSize: 13.sp,
                                        //       fontWeight: FontWeight.w500,
                                        //       textColor: appGreen,
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.NOTIFICATION);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(3.r),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: appGreen,
                                        ),
                                        child: const Icon(
                                          Icons.notifications_none_sharp,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          top: false,
          minimum: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Obx(
              () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Quote of the day',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    12.0.h.spacingH,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 19.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: const Color(0xffD3F5FF),
                      ),
                      child: CustomText(
                        text:
                            'Be where your feet are, grounded and still, The present is a gift; let it fulfil.',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    24.0.h.spacingH,
                    CustomText(
                      text: 'Your symptoms',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Nunito Sans',
                    ),
                    12.0.h.spacingH,
                    Obx(() {
                      final state = logic.settinState;

                      if (state.isLoading.value) {
                        return SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: const CircularProgressIndicator(
                              color: primaryColor),
                        );
                      }

                      if (state.allAssessment.isEmpty ||
                          (state.allAssessment.first.categories?.isEmpty ??
                              true)) {
                        return const Text(
                          "No assessment data available",
                          style: TextStyle(color: Colors.grey),
                        );
                      }

                      final categories = state.allAssessment.first.categories;

                      if (categories == null || categories.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return SizedBox(
                        width: 332,
                        child: Wrap(
                          spacing: 12.w,
                          runSpacing: 10.h,
                          alignment: WrapAlignment.center,
                          children: List.generate(categories.length, (index) {
                            return TagItem(
                              isSelected: true,
                              text: categories[index],
                            );
                          }),
                        ),
                      );
                    }),
                    24.0.h.spacingH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeaderText(
                          text: 'Upcoming Sessions',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        InkWell(
                          onTap: () {
                            logic.getUpcomingAppointment(context);
                          },
                          child: CustomText(
                            text: 'See all',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            textColor: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    16.0.h.spacingH,
                    state.isUpcoming.value
                        ? Center(
                            child: SizedBox(
                              height: 40.h,
                              width: 40.h,
                              child: const CircularProgressIndicator(),
                            ),
                          )
                        : state.upcomingAppointment.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: HeaderText(
                                    text: 'No upcoming appointment',
                                  ),
                                ),
                              )
                            : Column(
                                children: List.generate(
                                    state.upcomingAppointment.length > 3
                                        ? 3
                                        : state.upcomingAppointment.length,
                                    (index) {
                                  final appointment =
                                      state.upcomingAppointment[index];

                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: InkWell(
                                      child: buildUpcoming(
                                        appointment.doctor.fullName,
                                        '',
                                        appointment.doctor.profileImage ?? '',
                                        appointment.doctor.specializations
                                                .isNotEmpty
                                            ? appointment
                                                .doctor.specializations.first
                                            : '',
                                      ),
                                    ),
                                  );
                                }),
                              ),
                    24.0.h.spacingH,
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ALLTHERAPY);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeaderText(
                            text: 'Top Therapist',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: 'See all ',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            textColor: primaryColor,
                          ),
                        ],
                      ),
                    ),
                    16.0.h.spacingH,
                    if (state.isLoading.value)
                      const CircularProgressIndicator(
                        color: primaryColor,
                      )
                    //   )
                    else
                      Obx(() => Column(
                            children: state.doctor.isEmpty
                                ? [
                                    const Text("No doctor available",
                                        style: TextStyle(color: Colors.grey))
                                  ]
                                : List.generate(state.doctor.length, (index) {
                                    return InkWell(
                                        hoverColor: transparent,
                                        focusColor: transparent,
                                        onTap: () {
                                          Get.toNamed(Routes.KNOWNTHERAPIST,
                                              arguments: state.doctor[index]);
                                        },
                                        child: buildTopTherapist(
                                            state.doctor[index]));
                                  }),
                          )),
                    24.0.h.spacingH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeaderText(
                          text: 'Daily reading habit',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: 'See all',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          textColor: primaryColor,
                        ),
                      ],
                    ),
                    16.0.h.spacingH,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(state.article.length, (index) {
                          final articles = state.article[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.ARTICLE,
                                    arguments: articles);
                              },
                              child: buildDailyHabit(articles.image,
                                  articles.title, articles.body),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
