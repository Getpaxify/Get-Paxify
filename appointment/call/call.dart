import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/appointment/appointment.dart';
import 'package:paxify/modules/bottom_nav/bottom_nav_logic.dart';
import 'package:paxify/modules/appointment/call/call_logic.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';

class Call extends StatelessWidget {
  Call({super.key});
  final logic = Get.find<CallLogic>();
  final state = Get.find<CallLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/caller.jpg',
                  ),
                  fit: BoxFit.fitHeight)),
        ),
        Positioned(
          bottom: 20.h,
          right: MediaQuery.of(context).size.width * .16,
          //  left: MediaQuery.of(context).size.width*.16,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .64,
                padding: EdgeInsets.symmetric(vertical: 24.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: whiteColor.withOpacity(0.8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeaderText(
                      text: 'Dr. sara Adewale',
                    ),
                    12.h.spacingH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: appRed,
                          radius: 10.r,
                        ),
                        8.w.spacingW,
                        CustomText(
                          text: '19:00 minutes',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textColor: appBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              169.0.h.spacingH,
              SizedBox(
                width: MediaQuery.of(context).size.width * .64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: EdgeInsets.only(right: i == 2 ? 0.0 : 40.0),
                        child: CircleAvatar(
                            backgroundColor: appGreen,
                            child: Icon(
                              i == 0
                                  ? Icons.volume_up_outlined
                                  : i == 1
                                      ? Icons.add_ic_call_outlined
                                      : Icons.mic_none_rounded,
                              color: i == 1 ? appRed : whiteColor,
                            )),
                      )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
