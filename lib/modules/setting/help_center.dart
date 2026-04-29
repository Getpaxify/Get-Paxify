import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/assessment/achieve_view.dart';
import 'package:paxify/modules/setting/setting.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  InkWell(
          onTap: () {
            Get.back();
          },child: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const HeaderText(
          text: "Settings",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          textColor: appBlack,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Settings Options
          ListTile(
            onTap: () {
              // Get.toNamed(Routes.CHANGEPASSWORD);

              Get.bottomSheet(Container(
                padding: EdgeInsets.all(24.sp),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .27,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40.r))),
                child: Column(
                  children: [
                    HeaderText(
                      text: 'Please choose your preferred channel',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      textColor: appBlack,
                      textAlign: TextAlign.center,
                    ),
                    32.0.h.spacingH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // logic
                            //     .pickImage(ImageSource.gallery);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'images/mail.png',
                                height: 48.h,
                                width: 48.w,
                              ),
                              10.0.h.spacingH,
                              CustomText(
                                text: 'Email',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        ),
                        80.0.w.spacingW,
                        InkWell(
                          onTap: () {
                            // logic.pickImage(ImageSource.camera);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'images/whats.png',
                                height: 48.h,
                                width: 48.w,
                              ),
                              10.0.h.spacingH,
                              CustomText(
                                text: 'Whatsapp',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
              );
            },
            leading: Image.asset(
              'images/support (2).png',
              height: 24.h,
              width: 24.w,
            ),
            title: CustomText(
              text: "Chat with support",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: appBlack,
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),

          ListTile(
            onTap: () {
                Get.bottomSheet(Container(
                padding: EdgeInsets.all(24.sp),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .27,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40.r))),
                child: Column(
                  children: [
                    HeaderText(
                      text: 'Please choose your preferred channel',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      textColor: appBlack,
                      textAlign: TextAlign.center,
                    ),
                    32.0.h.spacingH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            // logic
                            //     .pickImage(ImageSource.gallery);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'images/link.png',
                                height: 48.h,
                                width: 48.w,
                              ),
                              10.0.h.spacingH,
                              CustomText(
                                text: 'LinkedIn',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            // logic.pickImage(ImageSource.camera);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'images/x.png',
                                height: 48.h,
                                width: 48.w,
                              ),
                              10.0.h.spacingH,
                              CustomText(
                                text: 'Twitter',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        ),
                                                InkWell(
                          onTap: () {
                            // logic.pickImage(ImageSource.camera);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'images/Group (1).png',
                                height: 48.h,
                                width: 48.w,
                              ),
                              10.0.h.spacingH,
                              CustomText(
                                text: 'Instagram',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    
                  ],
                ),
              )
              );
            },
            leading: Image.asset(
              'images/follow.png',
              height: 24.h,
              width: 24.w,
            ),
            title: CustomText(
              text: "Follow on Social Media",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: appBlack,
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}
