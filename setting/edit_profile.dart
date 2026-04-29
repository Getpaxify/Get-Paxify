import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paxify/modules/assessment/achieve_view.dart';
import 'package:paxify/modules/consultant/home_therapy/withdraw/withdraw_view.dart';
import 'package:paxify/modules/consultant/specialization/add_specialization_sheet.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/modules/setting/setting_state.dart';
import 'package:paxify/modules/signup/signin.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.chevron_left, color: Colors.black)),
        title: const HeaderText(
          text: "Settings",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          textColor: appBlack,
        ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Obx(() => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(children: [
                        SizedBox(
                          height: 200.h,
                          width: 170.w,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 180.h,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: fieldGrey),
                                    child: logic.selectedImage.value == null
                                        ? state.profileInformation.value
                                                    ?.profileImage ==
                                                null
                                            ? const Icon(
                                                Icons.image,
                                                color: whiteColor,
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                child: Image.network(
                                                  state.profileInformation.value
                                                          ?.profileImage ??
                                                      '',
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return Center(
                                                      child: SizedBox(
                                                        height: 40.h,
                                                        width: 40.h,
                                                        child:
                                                            const CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  },
                                                  errorBuilder: (context, url,
                                                          error) =>
                                                      const Icon(
                                                          Icons.broken_image),
                                                ),
                                              )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            child: Image.file(
                                                fit: BoxFit.fitWidth,
                                                logic.selectedImage.value!),
                                          ),
                                  ),
                                  const Spacer()
                                ],
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0.w,
                          child: state.isUpLoading.value
                              ? SizedBox(
                                  height: 40.h,
                                  width: 40.w,
                                  child: const CircularProgressIndicator(
                                    color: primaryColor,
                                  ))
                              : !state.showEditView.value
                                  ? SizedBox.shrink()
                                  : InkWell(
                                      onTap: () {
                                        // if (!state.showEditView.value) {
                                        //   state.showEditView.value = true;
                                        // } else {
                                        //   state.showEditView.value = false;
                                        // }
                                        Get.bottomSheet(Container(
                                          padding: EdgeInsets.all(24.sp),
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .23,
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          40.r))),
                                          child: Column(
                                            children: [
                                              HeaderText(
                                                text: 'Upload via',
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w600,
                                                textColor: appBlack,
                                              ),
                                              32.0.h.spacingH,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      logic.pickImage(
                                                          ImageSource.gallery);
                                                      Future.delayed(
                                                          const Duration(
                                                              seconds: 1), () {
                                                        Get.back();
                                                      });
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          'images/gallery.png',
                                                          height: 48.h,
                                                          width: 48.w,
                                                        ),
                                                        CustomText(
                                                          text: 'Gallery',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  80.0.w.spacingW,
                                                  InkWell(
                                                    onTap: () {
                                                      logic.pickImage(
                                                          ImageSource.camera);
                                                      Future.delayed(
                                                          const Duration(
                                                              seconds: 1), () {
                                                        Get.back();
                                                      });
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          'images/camera.png',
                                                          height: 48.h,
                                                          width: 48.w,
                                                        ),
                                                        CustomText(
                                                          text: 'Camera',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                      },
                                      child: Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            color: appGreen.withOpacity(0.3)),
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: Image.asset(
                                            'images/gallery.png',
                                            height: 21.h,
                                            width: 21.w,
                                          ),
                                        ),
                                      ),
                                    ),
                        )
                      ]),
                    ],
                  ),
                  24.0.h.spacingH,
                  state.showEditView.value
                      ? buildEditView(logic, state)
                      : state.isLoading.value
                          ? CircularProgressIndicator()
                          : Column(
                              children: [
                                buildProfileField(
                                    'Name', logic.nameController.text),
                                16.0.h.spacingH,
                                buildProfileField(
                                    'Email', logic.emailController.text),
                                16.0.h.spacingH,
                                buildProfileField(
                                    'Phone Number', logic.phoneController.text),
                                16.0.h.spacingH,
                                buildProfileField(
                                    'Gender', logic.genderController.text),
                                16.0.spacingH,
                                if (state.profileInformation.value?.role ==
                                    'doctor') ...[
                                  buildProfileField(
                                      'Bio', logic.bioController.text,height:logic.bioController.text.isEmpty?50:100 ),
                                      16.h.spacingH,
                                  buildProfileField('Bank',
                                      state.selectedBank.value?.name ?? ''),
                                  16.h.spacingH,
                                  buildProfileField('Account Number',
                                      logic.accountController.text),
                                  16.0.spacingH,
                                  buildProfileField('Account Name',
                                      logic.accountNameController.text),
                                  16.h.spacingH,
                                ]
                              ],
                            ),
                  16.0.h.spacingH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (state.isUpLoading.value)
                        SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: const CircularProgressIndicator(
                              color: primaryColor,
                            ))
                      else
                        InkWell(
                          onTap: () {
                            if (!state.showEditView.value) {
                              state.showEditView.value = true;
                            } else {
                              if (logic.selectedImage.value != null) {
                                logic.uploadUserImage(
                                    context, logic.selectedImage.value!);
                              }

                              logic.update();
                              logic.updateProfile(context);
                            }
                          },
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: appGreen.withOpacity(0.3)),
                            child: Transform.scale(
                              scale: 0.7,
                              child: state.showEditView.value
                                  ? const Icon(
                                      Icons.check,
                                      color: appGreen,
                                    )
                                  : Image.asset(
                                      'images/Group.png',
                                      height: 18.h,
                                      width: 18.w,
                                    ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  16.0.h.spacingH,
                ],
              )),
        ),
      ),
    );
  }
}

Widget buildProfileField(String label, String value, {double? height = 50}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: label,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        textColor: blackColor,
      ),
      8.0.h.spacingH,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 14.h),
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            color: const Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(16.r)),
        child: CustomText(
          text: value,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          textColor: fieldGrey,
        ),
      ),
    ],
  );
}

Widget buildEditView(SettingLogic logic, SettingState state) {
  return Column(
    children: [
      AuthTextField(
        fieldLabel: 'Name',
        controller: logic.nameController,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: fieldGrey,
        ),
      ),
      16.0.spacingH,
      AuthTextField(
        fieldLabel: 'Email',
        controller: logic.emailController,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: fieldGrey,
        ),
      ),
      16.0.spacingH,
      AuthTextField(
        fieldLabel: 'Phone Number',
        controller: logic.phoneController,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: fieldGrey,
        ),
      ),
      16.0.spacingH,
      AuthTextField(
        fieldLabel: 'Gender',
        controller: logic.genderController,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: fieldGrey,
        ),
      ),
      16.0.spacingH,
      if (state.profileInformation.value?.role == 'doctor') ...[
              AuthTextField(
        fieldLabel: 'Bio',
        controller: logic.bioController,
        maxLines: 4,
        hintText: 'Input your bio',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: fieldGrey,
        ),
      ),
      16.0.spacingH,
        AuthDropDown(
          label: 'Bank',
          option: state.selectedBank.value == null
              ? ''
              : state.selectedBank.value?.name,
          onTap: () {
            Get.bottomSheet(BankSheet());
          },
        ),
        16.0.spacingH,
        AuthDropDown(
          label: 'Specialization',
          option: state.specialization.isEmpty
              ? 'No specialization added'
              : state.specialization.join(','),
          onTap: () {
            Get.bottomSheet(
              isScrollControlled: true,
              IntrinsicHeight(child: AddSpecializationSheet()));
          },
        ),
        16.h.spacingH,
        AuthTextField(
          suffixIcon: Icon(Icons.cancel_outlined),
          fieldLabel: 'Account Number',
          controller: logic.accountController,
          keyboardType: TextInputType.numberWithOptions(),
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          onChange: (p0) {
            // logic.fieldFilled();
          },
          // controller: logic.lastName,
          obscure: false,
        ),
        16.0.spacingH,
        AuthTextField(
          fieldLabel: 'Account Name',
          controller: logic.accountNameController,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: fieldGrey,
          ),
        ),
        16.h.spacingH,
      ],
      
    ],
  );
}
