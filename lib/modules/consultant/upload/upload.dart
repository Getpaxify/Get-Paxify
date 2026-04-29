import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paxify/modules/appointment/appointment.dart';
import 'package:paxify/modules/consultant/upload/upload_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

class Upload extends StatelessWidget {
  Upload({super.key});
  final logic = Get.find<UploadLogic>();
  final state = Get.find<UploadLogic>().state;
  @override
  Widget build(BuildContext context) {
    final route = Get.arguments ?? '';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Obx(() => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderText(
                      text:
                          'Upload a valid license and means of identification',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    16.0.h.spacingH,
                    CustomText(
                      text: 'only JPEGS, PNG and PDF formats. ',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    16.0.h.spacingH,
                    HeaderText(
                      text: 'Max Sixe 5MB ',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      textColor: appGreen,
                    ),
                    16.0.h.spacingH,
                    CustomText(
                      text: 'Means of identification',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    16.0.h.spacingH,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.6, color: appBlack),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              state.selectedId.value != null
                                  ? Stack(
                                      children: [
                                        Image.file(
                                          state.selectedId.value!,
                                          height: 100,
                                        ),
                                        Positioned(
                                            top: 0.h,
                                            right: 0.w,
                                            child: InkWell(
                                                // onTap: () {
                                                //   // state.imagesSelected.removeWhere()

                                                //   state.imagesSelected
                                                //       .removeWhere(
                                                //     (item) =>
                                                //         item ==
                                                //         state.selectedId.value,
                                                //   );
                                                //   state.selectedId.value = null;
                                                //   log('${state.imagesSelected}');
                                                // },
                                                onTap: () {
                                                  final selected =
                                                      state.selectedId.value;

                                                  if (selected != null) {
                                                    state.imagesSelected
                                                        .removeWhere(
                                                      (item) =>
                                                          item.path ==
                                                          selected.path,
                                                    );
                                                    state.selectedId.value =
                                                        null;
                                                  }

                                                  log('Length: ${state.imagesSelected.length}');
                                                },
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: appRed,
                                                  size: 20.sp,
                                                )))
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                          state.option.length, (index) {
                                        return InkWell(
                                          onTap: () {
                                            switch (index) {
                                              case 0:
                                                logic.pickImage(
                                                    ImageSource.camera,
                                                    state.selectedId);
                                                break;
                                              case 1:
                                                logic.pickImage(
                                                    ImageSource.gallery,
                                                    state.selectedId);
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffF0F0F0),
                                                child: Icon(
                                                    state.option[index].image),
                                              ),
                                              8.0.h.spacingH,
                                              CustomText(
                                                text: state.option[index].label,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              )
                                            ],
                                          ),
                                        );
                                      })),
                              12.0.h.spacingH,
                              CustomText(
                                text:
                                    'A copy of national ID and other related document',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                textColor: greyText,
                              )
                            ],
                          )),
                    ),
                    24.0.h.spacingH,
                    CustomText(
                      text: 'License',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    16.0.h.spacingH,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.6, color: appBlack),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              state.selectedLicense.value != null
                                  ? Stack(
                                      children: [
                                        Image.file(
                                          state.selectedLicense.value!,
                                          height: 100,
                                        ),
                                        Positioned(
                                            top: 0.h,
                                            right: 0.w,
                                            child: InkWell(
                                                // onTap: () {
                                                //   state.imagesSelected
                                                //       .removeWhere(
                                                //     (item) =>
                                                //         item ==
                                                //         state.selectedLicense
                                                //             .value,
                                                //   );
                                                //   state.selectedLicense.value =
                                                //       null;
                                                //   log('${state.imagesSelected}');
                                                // },
                                                onTap: () {
                                                  final selected = state
                                                      .selectedLicense.value;

                                                  if (selected != null) {
                                                    state.imagesSelected
                                                        .removeWhere(
                                                      (item) =>
                                                          item.path ==
                                                          selected.path,
                                                    );
                                                    state.selectedLicense
                                                        .value = null;
                                                  }

                                                  log('Length: ${state.imagesSelected.length}');
                                                },
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: appRed,
                                                  size: 20.sp,
                                                )))
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                          state.option.length, (index) {
                                        return InkWell(
                                          onTap: () {
                                            switch (index) {
                                              case 0:
                                                logic.pickImage(
                                                    ImageSource.camera,
                                                    state.selectedLicense);
                                                break;
                                              case 1:
                                                logic.pickImage(
                                                    ImageSource.gallery,
                                                    state.selectedLicense);
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffF0F0F0),
                                                child: Icon(
                                                    state.option[index].image),
                                              ),
                                              8.0.h.spacingH,
                                              CustomText(
                                                text: state.option[index].label,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              )
                                            ],
                                          ),
                                        );
                                      })),
                              12.0.h.spacingH,
                              CustomText(
                                text:
                                    'A copy of national ID and other related document',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                textColor: greyText,
                              )
                            ],
                          )),
                    ),
                    40.0.h.spacingH,
                    SizedBox(
                      width: 320.w,
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text:
                              'By tapping ‘Continue’, you confirm that you have read our ',
                          style: TextStyle(
                            color: greyText,
                            fontFamily: 'privacy policy ',
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                          children: [
                            TextSpan(
                              text: 'privacy policy ',
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                color: greyText,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' agreed to our terms of service',
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Get.toNamed(Routes.LOGINVIEW);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    40.0.h.spacingH,
                    state.isUpLoading.value
                        ? Center(
                          child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                        )
                        : LoadButton(
                            label: 'Continue',
                            color: primaryColor,
                            function: () {
                              logic.uploadProviderId(context, route);
                              // log('${state.imagesSelected.length}');
                            }),
                            20.0.h.spacingH,
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
