import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paxify/modules/consultant/home_therapy/home_logic.dart';
import 'package:paxify/modules/home_therapy/component.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';

class ConsultantHomeView extends StatelessWidget {
  ConsultantHomeView({super.key});
  final logic = Get.find<ConsultantHomeLogic>();
  final state = Get.find<ConsultantHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                  background: Obx(() => Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'images/Frame 37995.png',
                            fit: BoxFit.cover,
                          ),
                          SafeArea(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Column(
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
                                                errorBuilder:
                                                    (context, url, error) =>
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
                                          Row(
                                            children: [
                                              CustomText(
                                                text:
                                                    '#${logic.settinState.profileInformation.value?.wallet?.balance.toString() ?? '0.00'}',
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                textColor: Colors.white,
                                              ),
                                              5.0.w.spacingW,
                                              InkWell(
                                                onTap: () {
                                                  if (logic
                                                          .settinState
                                                          .profileInformation
                                                          .value
                                                          ?.wallet
                                                          ?.bankName !=
                                                      null) {
                                                    Get.toNamed(
                                                        Routes.WITHDRAWCON);
                                                  } else {
                                                    logic.showAddBankDialog();
                                                  }
                                                },
                                                child: CustomText(
                                                  text: 'Withdraw',
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                  textColor: appGreen,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
Get.toNamed(Routes.SPECIALIZATION);
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
                                  12.0.h.spacingH,
                                  // Search Field
                                  // AuthTextField(
                                  //   fieldLabel: '',
                                  //   borderColor: fieldGrey,
                                  //   filledColor: transparent,
                                  //   prefixIcon:
                                  //       const Icon(Icons.search, color: fieldGrey),
                                  //   suffixIcon: Transform.scale(
                                  //     scale: 0.4,
                                  //     child: SizedBox(
                                  //         height: 18.h,
                                  //         width: 18.w,
                                  //         child: Image.asset('images/filt.png')),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ];
          },
          body: SafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              // padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: CustomText(
                      text: 'Overview',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      textColor: primaryColor,
                    ),
                  ),
                  12.0.h.spacingH,
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 19.h),
                      decoration: const BoxDecoration(
                        color: Color(0xffF0F0F0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _StatCard(
                            number: logic.settinState.profileInformation.value
                                    ?.doctorProfile?.numberOfSessions
                                    .toString() ??
                                '',
                            label: 'Total Clients',
                            icon: 'images/client.png',
                            backgroundColor: Color(0xFFDFFFE2), // light green
                            iconColor: Color(0xFF00C853), // appGreen
                          ),
                          _StatCard(
                            number: logic.settinState.profileInformation.value
                                    ?.numberOfbookings
                                    .toString() ??
                                '',
                            label: 'Total Sessions',
                            icon: 'images/ses.png',
                            backgroundColor: Color(0xFFDCEBFF), // light blue
                            iconColor: Color(0xFF1E88E5), // blue
                          ),
                          _StatCard(
                            number: logic.settinState.profileInformation.value
                                    ?.averageRating
                                    .toString() ??
                                '',
                            label: 'Ratings',
                            icon: 'images/Vector (4).png',
                            backgroundColor: Color(0xFFFFF1E0), // light orange
                            iconColor: Color(0xFFFFA726), // orange
                          ),
                        ],
                      )),
                  24.0.h.spacingH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: CustomText(
                      text: 'Schedule',
                      textColor: primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Nunito Sans',
                    ),
                  ),
                  10.0.h.spacingH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SizedBox(
                      height: 50.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.getWeekDates().length,
                        itemBuilder: (context, index) {
                          DateTime date = state.getWeekDates()[index];
                          state.isSelected.value = date.day ==
                                  state.selectedDate.value.day &&
                              date.month == state.selectedDate.value.month &&
                              date.year == state.selectedDate.value.year;

                          return GestureDetector(
                            onTap: () {
                              state.selectDate(date);
                            },
                            child: Container(
                              width: 50.w,
                              // height: 49.h,
                              margin: EdgeInsets.only(right: 6.w),
                              decoration: BoxDecoration(
                                color: state.isSelected.value
                                    ? Colors.teal[800]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: state.isSelected.value
                                      ? Colors.teal[800]!
                                      : Colors.grey,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: DateFormat.E().format(date),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans',
                                    textColor: state.isSelected.value
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  CustomText(
                                    text: date.day.toString(),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito Sans',
                                    textColor: state.isSelected.value
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  10.0.h.spacingH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeaderText(
                          text: 'Upcoming Sessions',
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
                  ),
                  16.0.h.spacingH,
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Column(
                  //     children: List.generate(2, (index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(bottom: 16.0),
                  //         child: InkWell(
                  //             onTap: () {
                  //               Get.toNamed(Routes.THERAPIST);
                  //             },
                  //             child: buildUpcoming()),
                  //       );
                  //     }),
                  //   ),
                  // ),
                  24.0.h.spacingH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeaderText(
                          text: 'Previous Sessions',
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
                  ),
                  16.0.h.spacingH,
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Column(
                  //     children: List.generate(2, (index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(bottom: 16.0),
                  //         child: InkWell(
                  //             onTap: () {
                  //               Get.toNamed(Routes.THERAPIST);
                  //             },
                  //             child: buildUpcoming()),
                  //       );
                  //     }),
                  //   ),
                  // ),
                  24.0.h.spacingH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
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
                  ),
                  16.0.h.spacingH,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  ),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final String icon;
  final Color backgroundColor;
  final Color iconColor;

  const _StatCard({
    super.key,
    required this.number,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Transform.scale(
            scale: 0.5,
            child: SizedBox(
              height: 17.h,
              width: 21.w,
              child: Image.asset(
                icon,
                height: 17.h,
                width: 21.w,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        CustomText(
          text: number,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          textColor: Colors.black,
        ),
        SizedBox(height: 4.h),
        CustomText(
          text: label,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          // textColor: Colors.grey,
        ),
      ],
    );
  }
}
