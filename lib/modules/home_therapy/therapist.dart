import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paxify/model/get_doctor_model.dart';
import 'package:paxify/modules/home_therapy/stat_tile.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

import '../../theme/app_colors.dart';
import 'home_logic.dart';

class Therapist extends StatelessWidget {
  Therapist({super.key});
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    GetDoctorData doctor = Get.arguments;
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
          text: doctor.fullName,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Obx(() => Column(
                children: [ Image.asset(
                'images/known.png',
                height: 180.h,
                width: 150.w,
              ),
              16.0.h.spacingH,
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                StatTile(
                  statValue: doctor.numberOfPatients.toString(),
                  icon: Icons.person_outline,
                  label: 'Patients',
                ),
                StatTile(
                    statValue: doctor.yearsOfExperience ?? '0',
                    icon: Icons.trending_up,
                    label: 'Years Exp.'),
                StatTile(
                    statValue: doctor.averageRating??'0.0',
                    icon: Icons.star_border,
                    label: 'Ratings'),
                StatTile(
                    statValue: doctor.totalReviews.toString(),
                    icon: Icons.chat_bubble_outline,
                    label: 'Reviews')
              ]),
              24.0.h.spacingH,
              Container(
                padding: EdgeInsets.all(16.sp),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: const Color(0xffF0F0F0)),
                child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: state.formattedMonth,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Nunito Sans',
                        ),
                        12.0.h.spacingH,
                        SizedBox(
                          height: 50.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.getWeekDates().length,
                            itemBuilder: (context, index) {
                              DateTime date = state.getWeekDates()[index];
                              bool isSelected = date.day ==
                                      state.selectedDate.value.day &&
                                  date.month ==
                                      state.selectedDate.value.month &&
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
                                    color: isSelected
                                        ? Colors.teal[800]
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: isSelected
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
                                        textColor: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      CustomText(
                                        text: date.day.toString(),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Nunito Sans',
                                        textColor: isSelected
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
                        24.0.h.spacingH,
                        Center(
                          child: Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: state.timeSlots.map((time) {
                              bool isSelected =
                                  state.selectedTime.value == time;
                              return GestureDetector(
                                onTap: () {
                                  state.selectedTime.value = time;
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.teal[800]
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.teal[800]!
                                          : Colors.grey,
                                    ),
                                  ),
                                  child: CustomText(
                                    text: time,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    )),
              ),
              24.0.h.spacingH,
              Row(
                children: [
                  CustomText(
                    text: 'Meeting type',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              16.0.h.spacingH,
              buildType(Icons.phone_outlined, 'Voice call', '#2,320'),
              16.0.h.spacingH,
              buildType(Icons.videocam_outlined, 'Video call', '#4,320'),
              40.0.h.spacingH,
              state.isBookDoctor.value
                  ? CircularProgressIndicator(
                      color: primaryColor,
                    )
                  : LoadButton(
                      label: 'Confirm Booking',
                      function: () {

                        logic.bookDoctor(context, doctor.id,
                        '${DateFormat("yyyy-MM-dd").format(state.selectedDate.value)} ${state.selectedTime.value}');
                        // Get.toNamed(Routes.AVAILABLEPLAN);
                      })],
              )),
        ),
      ),
    );
  }
}

Widget buildType(IconData icon, String type, String cost) {
  return Row(
    children: [
      Container(
        height: 40.w,
        width: 40.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF1C4E58),
        ),
        child: Icon(icon, color: Colors.white, size: 24.w),
      ),
      12.0.w.spacingW,
      CustomText(
        text: type,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      const Spacer(),
      CustomText(
        text: cost,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        textColor: appGreen,
      ),
    ],
  );
}
