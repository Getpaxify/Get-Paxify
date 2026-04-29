import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/appointment/appointment.dart';
import 'package:paxify/modules/appointment/appointment_state.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';

import '../appointment_logic.dart';

class Chat extends StatelessWidget {
  Chat({super.key});
  final logic = Get.find<AppointmentLogic>();
  final state = Get.find<AppointmentLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Obx(() => Column(
              children: [
                Expanded(
              child: ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: state.messages[index].user
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        buildResponse(logic, state.messages[index].content,
                            state.messages[index].user),
                      ],
                    );
                  }),
            ),
            AuthTextField(
              fieldLabel: '',
              radius: 24.r,
              controller: logic.controller,
              prefixIcon: Image.asset('images/file.png'),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: SizedBox(
                  width: 55.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mic_none_outlined,
                        color: fieldGrey,
                      ),
                      6.w.spacingW,
                      InkWell(
                        onTap: () {
                          log(logic.controller.text);
                          state.messages.add(Message(
                              content: logic.controller.text, user: false));
                          Future.delayed(Duration(seconds: 1), () {
                            state.messages.add(Message(
                                content:
                                    'Kindly wait, i will respond soon. In the mean time, kindly wait',
                                user: true));
                          });
                        },
                        child: Image.asset(
                          'images/send.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
              ],
            )),
      ),
    );
  }
}

Widget buildResponse(AppointmentLogic logic, String content, bool user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: Get.width * 0.4
        ),
        child: Container(
            padding: EdgeInsets.all(10.0.h),
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              color: transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: CustomText(
              text: content,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              textColor: appBlack,
            )),
      ),
      4.0.h.spacingH,
      CustomText(
        text: logic.formatTimeOfDay(TimeOfDay.now()),
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        textColor: appBlack,
      )
    ],
  );
}
