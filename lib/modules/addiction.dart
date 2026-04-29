import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/assessment/assessment_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';
import 'package:paxify/widgets/snackbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AchieveView extends StatelessWidget {
  AchieveView({super.key});
  final logic = Get.find<AssessmentLogic>();
  final state = Get.find<AssessmentLogic>().state;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);
    return Scaffold(
      body: SafeArea(
        child: Obx(() => SmartRefresher(
              controller: refreshController,
              onRefresh: () {
                logic.onRefresh();
                refreshController.refreshCompleted();

                state.reloadTy.value = 0;
              },

              onLoading: () {
                logic.onLoading();
                refreshController.loadComplete();
              },
              enablePullUp: false,
              header: const ClassicHeader(
                releaseText: '',
                completeText: '',
                releaseIcon: const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    color: primaryColor,
                    strokeWidth: 1.5,
                  ),
                ),
              ),
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .04,
                    ),
                    Stack(children: [
                      Image.asset('images/bg.png'),
                      Positioned(
                        top: 47.h,
                        left: 24.w,
                        right: 24.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/d1.png',
                              width: size.width * .3,
                              height: 152.4,
                            ),
                            5.0.w.spacingW,
                            Column(
                              children: [
                                Image.asset(
                                  'images/d2.png',
                                  width: 87.w,
                                  height: 91,
                                ),
                                Image.asset(
                                  'images/d3.png',
                                  width: 87.w,
                                  height: 91,
                                ),
                              ],
                            ),
                            5.0.w.spacingW,
                            Image.asset(
                              'images/d3.png',
                              width: size.width * .3,
                              height: 152.4,
                            ),
                          ],
                        ),
                      )
                    ]),
                    44.0.h.spacingH,
                    CustomText(
                      text: 'What can we help you achieve?',
                      textColor: primaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito Sans',
                    ),
                    12.0.h.spacingH,
                    CustomText(
                      text:
                          'We have experts that can help you through your journey, select where you need help.',
                      textColor: const Color(0xff888888),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Nunito Sans',
                      textAlign: TextAlign.center,
                    ),
                    36.0.h.spacingH,
                    state.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : state.allAssessment.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: CustomText(
                                  text: 'No Data Found',
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                width: double.infinity,
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 20,
                                  alignment: WrapAlignment.center,
                                  children: List.generate(
                                    state.allAssessment.length,
                                    (index) {
                                      final assessment =
                                          state.allAssessment[index];
                                      return InkWell(
                                          onTap: () {
                                            state.currentIndex.value = index;
                                            logic.selectAddiction(assessment.id);
                                          },
                                          child: _buildTag(
                                              assessment.name,
                                              state.selectedAddiction
                                                      .contains(assessment.id)
                                                  ? primaryColor
                                                  : whiteColor,
                                              state.selectedAddiction
                                                      .contains(assessment.id)
                                                  ? whiteColor
                                                  : primaryColor));
                                    },
                                  ),
                                ),
                              ),
                    40.0.h.spacingH,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: LoadButton(
                          label: 'Continue',
                          function: state.selectedAddiction.isEmpty
                              ? () {
                                  AppSnackbar.error(context,
                                      message:
                                          'Please select a category to continue');
                                }
                              : () {
                                  Get.toNamed(Routes.ADDICTION);
                                }),
                    ),
                    40.0.h.spacingH,
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

Widget _buildTag(String text, Color color, Color textColor) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
    decoration: BoxDecoration(
      color: color,
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
    child: CustomText(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      textColor: textColor,
    ),
  );
}
