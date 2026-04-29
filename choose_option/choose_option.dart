import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/choose_option/choose_option_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';



class ChooseOption extends StatelessWidget {
  ChooseOption({super.key});
  final logic = Get.find<ChooseOptionLogic>();
  final state = Get.find<ChooseOptionLogic>().state;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.0.sp),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(
                  text: 'How can we help you today',
                ),
                16.0.h.spacingH,
                CustomText(
                  text: 'Choose  an option below to get started',
                ),
                32.0.h.spacingH,
                Row(
                  children: [
                    Radio(
                        activeColor: primaryColor,
                        visualDensity: VisualDensity(
                            horizontal: VisualDensity.minimumDensity),
                        value: 1,
                        groupValue: state.optionGoupValue.value,
                        onChanged: (val) {
                          state.optionGoupValue.value = val!;
                          state.mode.value = 'Patient';
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'I need help (patient)',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        4.0.h.spacingH,
                        SizedBox(
                          width: 288.w,
                          child: CustomText(
                            text:
                                'For individuals seeking guidance or support from mental health professionals',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                20.0.h.spacingH,
                Row(
                  children: [
                    Radio(
                        visualDensity: VisualDensity(
                            horizontal: VisualDensity.minimumDensity),
                        value: 2,
                        activeColor: primaryColor,
                        groupValue: state.optionGoupValue.value,
                        onChanged: (val) {
                          state.optionGoupValue.value = val!;
                          state.mode.value = 'Doctor';
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'I am a Consultant',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        4.0.h.spacingH,
                        SizedBox(
                          width: 288.w,
                          child: CustomText(
                            text:
                                'For professionals offering mental health services.',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                60.0.h.spacingH,
                LoadButton(
                    label: 'Continue',
                    function: () {
                      if (state.mode.value == 'Doctor') {
                        Get.toNamed(Routes.SIGNUPVIEW);
                        state.userNature.value = 2;
                      } else {
                        Get.toNamed(Routes.SIGNUPVIEW);
                                                state.userNature.value = 1;
                      }
                    })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
