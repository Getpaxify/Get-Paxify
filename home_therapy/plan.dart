import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paxify/model/subscription_cat_model.dart';
import 'package:paxify/modules/home_therapy/home_logic.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';
import 'package:paxify/widgets/snackbar.dart';

class Plan extends StatelessWidget {
  Plan({super.key});
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  SubscriptionCatModel plan = Get.arguments ?? null;
  @override
  Widget build(BuildContext context) {
    state.selectedPrices.value = List.generate(plan.subPlans.length, (_) => -1);
    state.selectedPriceIds.value =
        List.generate(plan.subPlans.length, (_) => "");
    state.selectedExpiredDay.value =
        List.generate(plan.subPlans.length, (_) => -1);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.chevron_left)),
        centerTitle: true,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: HeaderText(
          text: plan.name,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Click To Join Therapy Plan For Individual.",
              fontSize: 14,
              textColor: Colors.grey,
            ),
            const SizedBox(height: 16),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(color: Colors.teal),
              ),
              child:  Column(
                    children: [
                      Expanded(
                              child: ListView.builder(
                                itemCount: plan.subPlans.length,
                                itemBuilder: (context, planIndex) {
                                  final plans = plan.subPlans[planIndex];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 24.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                width: 0.6, color: appGreen),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .business_center_outlined,
                                                      color: appGreen),
                                                  const SizedBox(width: 8),
                                                  HeaderText(
                                                    text: plans.name,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: appBlack,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              const CustomText(
                                                text:
                                                    "Select Your Preferred Subscription Plan To Proceed",
                                                fontSize: 10,
                                                textColor: fieldGrey,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              const SizedBox(height: 10),
                                              Wrap(
                                                  spacing: 34,
                                                  runSpacing: 8,
                                                  children: List.generate(
                                                      plans.options.length,
                                                      (index) {
                                                    final option =
                                                        plans.options[index];
                                                    return Obx(() => Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            HeaderText(
                                                              text: option
                                                                  .billingCycle
                                                                  .name,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              textColor:
                                                                  primaryColor,
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                            InkWell(
                                                              onTap: () {
                                                                state.selectedPrices[
                                                                        planIndex] =
                                                                    index;
                                                                state.selectedExpiredDay[
                                                                        planIndex] =
                                                                    option
                                                                        .billingCycle
                                                                        .durationInDays;
                                                                state.selectedPriceIds[
                                                                        planIndex] =
                                                                    option.id;
                                                                state
                                                                    .selectedPrices
                                                                    .refresh(); //
                                                              },
                                                              child: Container(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        12,
                                                                    vertical:
                                                                        6),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: state.selectedPrices[
                                                                              planIndex] ==
                                                                          index
                                                                      ? primaryColor
                                                                      : transparent,
                                                                  border: Border.all(
                                                                      width:
                                                                          0.6,
                                                                      color: state.selectedPrices[planIndex] ==
                                                                              index
                                                                          ? primaryColor
                                                                          : fieldGrey),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.r),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    CustomText(
                                                                      text:
                                                                          '₦${option.price.toString()}',
                                                                      fontSize:
                                                                          14,
                                                                      textColor: state.selectedPrices[planIndex] ==
                                                                              index
                                                                          ? whiteColor
                                                                          : appBlack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ));
                                                  })),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 24.h),
                                         Obx(() => Column(
                                                  children: [
                                                    logic.settinState.isLoading.value
                                            ? CircularProgressIndicator()
                                            :
                                                    LoadButton(
                                                        label: 'Subscribe',
                                                        function: () {
                                                          if (state.selectedPrices[
                                                                  planIndex] ==
                                                              -1) {
                                                            AppSnackbar.error(
                                                                context,
                                                                message:
                                                                    'Kindly pick a plan');
                                                            return;
                                                          }

                                                          logic.settingLogic
                                                              .userSub(
                                                            context,
                                                            state
                                                                .selectedPriceIds
                                                                .first,
                                                          );
                                                          log(state
                                                              .selectedPriceIds
                                                              .first);
                                                        }),
                                                  ],
                                                )),
                                        SizedBox(height: 12),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
            ),
          ],
        )),
      ),
    );
  }
}
