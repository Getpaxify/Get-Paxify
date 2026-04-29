import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/main.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/widgets/app_bar.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'notification_logic.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  final logic = Get.find<NotificationLogic>();
  final state = Get.find<NotificationLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Notifications',
        center: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => logic.markAllAsRead(),
              child: const CustomText(
                text: "Mark All As Read",
                textColor: primaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(() {
                  if (state.notifications.isEmpty) {
                    return const Center(
                      child: Text("No Notifications"),
                    );
                  }

                  return ListView.separated(
                    itemCount: state.notifications.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 25),
                    itemBuilder: (_, index) {
                      final item = state.notifications[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderText(
                            text: item.title,
                          ),
                          const SizedBox(height: 6),
                          CustomText(
                            text: item.message,
                            textColor: Color(0XFF333333),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Spacer(),
                              CustomText(
                                text: item.date,
                                fontSize: 10.sp,
                                textColor: greyText,
                              ),
                               SizedBox(width: 12.w),
                              CustomText(
                                text: item.time,
                                fontSize: 10.sp,
                                textColor: greyText,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
