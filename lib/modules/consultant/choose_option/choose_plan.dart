import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/choose_option/choose_option_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

class ChoosePlan extends StatelessWidget {
  ChoosePlan({super.key});
  final logic = Get.find<ChooseOptionLogic>();
  final state = Get.find<ChooseOptionLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(18.0.sp),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(
                text: 'Plan Option',
              ),
              16.0.h.spacingH,
              const CustomText(
                text: 'Choose  an option below;',
              ),
              32.0.h.spacingH,
              Column(
                children: List.generate(state.plan.length, (index) {
                  return Row(
                    children: [
                      Radio(
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity),
                          value: index,
                          activeColor: primaryColor,
                          groupValue: state.currentIndexI.value,
                          onChanged: (val) {
                            state.currentIndexI.value = val!;
                           
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: state.plan[index],
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
              176.0.h.spacingH,
              LoadButton(
                  label: 'Continue',
                  function: () {
                    Get.toNamed(Routes.HMO);
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
