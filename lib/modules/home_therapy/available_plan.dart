import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'package:paxify/modules/home_therapy/home_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';

class AvailablePlan extends StatelessWidget {
  AvailablePlan({super.key});
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const HeaderText(
          text: "Available Plans",
          fontSize: 18,
          fontWeight: FontWeight.w600,
          textColor: appBlack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Therapy That Suits Your Pocket",
              fontSize: 14,
              textColor: appBlack,
            ),
            const SizedBox(height: 16),
            Column(
                children:
                    List.generate(logic.settinState.plans.length, (index) {
              final plans = logic.settinState.plans[index];
              return InkWell(
                hoverColor: transparent,
                onTap: () {
                  Get.toNamed(Routes.PLAN, arguments: plans);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 15.r,
                          backgroundColor: whiteColor,
                          child: const Icon(
                            Icons.person_2_outlined,
                            size: 20,
                            color: primaryColor,
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderText(
                              text: plans.name,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              textColor: appBlack,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 230.w,
                                  child: CustomText(
                                      text: plans.name.contains('Individual')
                                          ? 'Click To Join Therapy Plan You Can Be Abl To Pay For.'
                                          : plans.name.contains('HMO')
                                              ? 'Click To Join Therapy Plan Covered By Your HMO.'
                                              :  plans.name.contains('Corporate')
                                              ?'Click To Join Therapy Plan Covered By Your Company.':'Choose your plan',
                                      fontSize: 12,
                                      textColor: appBlack,
                                      fontWeight: FontWeight.w400),
                                ),
                                28.w.spacingW,
                                Icon(
                                  Icons.chevron_right,
                                  size: 18,
                                  color: Colors.teal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
          ],
        ),
      ),
    );
  }
}
