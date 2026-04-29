import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/assessment/assessment_logic.dart';
import 'package:paxify/modules/choose_option/choose_occupation.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

class Assessment extends StatelessWidget {
  Assessment({super.key});
  final logic = Get.find<AssessmentLogic>();
  final state = Get.find<AssessmentLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff154553),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .52,
                    child: Stack(children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset(
                              'images/ass.png',
                              height: 264.h,
                              width: 198.w,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20.0.w,
                        top: 146.h,
                        child: Image.asset(
                          'images/ass1.png',
                          height: 264.h,
                          width: 198.w,
                        ),
                      ),
                    ]),
                  ),
                ),
                24.0.h.spacingH,
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.steps.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: appGreen,
                                child: Icon(
                                  getIcon(state.steps[index]['icon']!),
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                              if (index != state.steps.length - 1)
                                Container(
                                  width: 2.w,
                                  height: 40.h,
                                  color: Colors.green,
                                ),
                            ],
                          ),
                          SizedBox(width: 4.w),
                          SizedBox(
                            width: 258.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: state.steps[index]['title']!,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.white,
                                  fontFamily: 'Nunito Sans',
                                ),
                                SizedBox(height: 4.h),
                                CustomText(
                                  text: state.steps[index]['description']!,
                                  fontSize: 14.sp,
                                  textColor: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                36.0.h.spacingH,
                LoadButton(
                  label: 'Start Assessment',
                  function: () {
                    Get.toNamed(Routes.ACHIEVEMENT);
                  },
                  color: appGreen,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

IconData getIcon(String iconName) {
  switch (iconName) {
    case 'favorite':
      return Icons.favorite_border;
    case 'calendar_today':
      return Icons.calendar_today;
    case 'chat':
      return Icons.videocam_outlined;
    case 'check_circle':
      return Icons.star_border_outlined;
    default:
      return Icons.help;
  }
}
