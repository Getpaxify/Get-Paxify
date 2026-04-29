import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/choose_option/choose_option_logic.dart';
import 'package:paxify/modules/choose_option/choose_option_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

class HmoPlan extends StatelessWidget {
  HmoPlan({super.key});

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
                text: 'How would you want to proceed?',
              ),
              16.0.h.spacingH,
              const CustomText(
                text: 'Choose  an option below;',
              ),
              62.0.h.spacingH,
              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                buildBox('images/hm.png', () {
                  state.proceedWith.value = Hmo.nonHmo;
                },
                    'Without HMO',
                    state.proceedWith.value == Hmo.nonHmo
                        ? primaryColor
                        : transparent),
                40.w.spacingW,
                buildBox('images/office bag.png', () {
                  state.proceedWith.value = Hmo.hmo;
                },
                    'With HMO',
                    state.proceedWith.value == Hmo.hmo
                        ? primaryColor
                        : transparent),
              ]),
              40.0.h.spacingH,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                buildBox('images/reader.png', () {
                  state.proceedWith.value = Hmo.corporate;
                },
                    'With Corporate Plan',
                    state.proceedWith.value == Hmo.corporate
                        ? primaryColor
                        : transparent),
              ]),
              67.0.h.spacingH,
              LoadButton(
                  label: 'Continue',
                  function: () {
                    Get.toNamed(Routes.SIGNINVIEW, arguments: state.proceedWith);
                  })
            ],
          ),
        ),
      ),
    ));
  }
}

Widget buildBox(String image, Function() ontap, String label, Color color) {
  return Column(
    children: [
      InkWell(onTap: ontap,
        child: Container(
          padding: EdgeInsets.all(2.sp),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(16.r)),
          child: Container(
            padding: EdgeInsets.all(26.sp),
            decoration: BoxDecoration(
                color: Color(0xffD3F5FF),
                borderRadius: BorderRadius.circular(16.r)),
            child: Center(
                child: Image.asset(
              image,
              height: 48.h,
              width: 48.w,
            )),
          ),
        ),
      ),
      16.0.h.spacingH,
      CustomText(
        text: label,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      )
    ],
  );
}
