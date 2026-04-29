import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/assessment/assessment_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';
import 'package:paxify/widgets/snackbar.dart';

class Addiction extends StatelessWidget {
  Addiction({super.key});
  final logic = Get.find<AssessmentLogic>();
  final state = Get.find<AssessmentLogic>().state;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * .04,
                  ),
                  CircleAvatar(
                    child: Image.asset('images/frustrated.png'),
                  ),
                  39.0.h.spacingH,
                  CustomText(
                    text:state.selectedCategory.value?.name??'',
                    textColor: const Color(0xff333333),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito Sans',
                  ),
                  24.0.h.spacingH,
                  CustomText(
                    text: 'choose the intensity of your addiction',
                    textColor: const Color(0xff333333),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  16.0.h.spacingH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: state.labels
                        .map((label) => Column(
                              children: [
                                Text(label,
                                    style: const TextStyle(fontSize: 14)),
                                const SizedBox(height: 4),
                                Container(
                                  width: 2,
                                  height: 10,
                                  color: Colors.green,
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: primaryColor,
                      inactiveTrackColor: Colors.lightBlue.withOpacity(0.2),
                      thumbColor: Colors.teal[800],
                      overlayColor: Colors.teal.withOpacity(0.2),
                      trackHeight: 3.0,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 10),
                    ),
                    child: Slider(
                      value: state.sliderValue.value,
                      min: 0,
                      max: 100,
                      divisions: 3,
                      onChanged: (value) {
                        state.sliderValue.value = value;
                        logic.setIntensity();
                      },
                    ),
                  ),
                  40.0.h.spacingH,
                  Row(
                    children: [
                      CustomText(
                        text: 'What is the cause of your addiction',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  16.0.h.spacingH,
                  Wrap(
                    spacing: 24.0,
                    runSpacing: 12.0,
                    children: List.generate(
                      state.causes.length,
                      (index) {
                        final cause = state.causes[index];
                        return InkWell(
                          onTap: () {
                            logic.selectCause(cause);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: state.selectedCauses.contains(cause)
                                  ? primaryColor
                                  : transparent,
                              border: Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: CustomText(
                              text: cause['cause'],
                              fontSize: 16.sp,
                              textColor: state.selectedCauses.contains(cause)
                                  ? whiteColor
                                  : Colors.blueGrey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  20.0.spacingH,
                  Row(
                    children: [
                      CustomText(
                        text: 'Let’s write about it',
                        fontSize: 16.sp,
                        textColor: appBlack,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Nunito Sans',
                      ),
                    ],
                  ),
                  8.0.spacingH,
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .86,
                        child: CustomText(
                          text:
                              'Help your therapist to understand better, so as to know how to help you.',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Nunito Sans',
                          textColor: appBlack,
                        ),
                      ),
                    ],
                  ),
                  AuthTextField(
                    fieldLabel: '',
                    controller: logic.noteController,
                    height: 120.h,
                    max: 3,
                  ),
                  40.0.h.spacingH,
                  state.isLoading.value?Center(child: CircularProgressIndicator(color: primaryColor,))
                 : LoadButton(
                      label: 'Continue',
                      function: state.selectedCauses.isEmpty
                          ? () {
                              AppSnackbar.error(context,
                                  message: 'Please select causes to continue');
                            }
                          : () {
                              logic.createAssessment(context);
                            }),
                  20.0.h.spacingH,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
