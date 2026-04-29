import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/consultant/specialization/add_specialization_sheet.dart';
import 'package:paxify/modules/consultant/upload/upload_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';
import 'package:paxify/widgets/snackbar.dart';

class Specialization extends StatelessWidget {
  Specialization({super.key});
  final logic = Get.find<UploadLogic>();
  final state = Get.find<UploadLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Obx(() => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderText(
                      text: 'Add Specialization With Bio',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    24.0.h.spacingH,
                    AuthTextField(
                      fieldLabel: 'Add Specialization',
                      controller: logic.specializationController,
                      maxLines: 5,
                    ),
                    20.0.h.spacingH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * .1,
                          child: LoadButton(
                            label: 'Add',
                            color: primaryColor,
                            function: () {
                              if (state.specialization.contains(
                                  logic.specializationController.text)) {
                                AppSnackbar.error(context,
                                    message: 'Specialization already added');
                                logic.specializationController.clear();
                              } else if (logic
                                  .specializationController.text.isEmpty) {
                              }else if(state.specialization.length==4){                                AppSnackbar.error(context,
                                    message: 'You can only add up to 4 specializations');
                                logic.specializationController.clear();} else {
                                state.specialization
                                    .add(logic.specializationController.text);
                                    logic.specializationController.clear();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    5.0.h.spacingH,
                    Wrap(
                      children: state.specialization
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Chip(
                                  onDeleted: () {
                                    state.specialization.remove(e);
                                  },
                                  label: CustomText(
                                    text: e,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  backgroundColor: whiteColor,
                                  side: BorderSide(color: primaryColor),
                                ),
                              ))
                          .toList(),
                    ),
                    16.0.h.spacingH,
                    AuthTextField(
                      fieldLabel: 'Enter Bio',
                      controller: logic.bioController,
                      maxLines: 5,
                      inputFormatters: [LengthLimitingTextInputFormatter(150)],
                    ),
                    25.0.h.spacingH,
                     CustomText(
                          text: '*Note: You can add up to 4 specializations\n*Make sure your bio is concise and informative and must not be more than 150 words',
                          textAlign: TextAlign.start,
                          textColor: greyText,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                                            8.0.h.spacingH,
                    state.isUpLoading.value
                        ? const CircularProgressIndicator(
                            color: primaryColor,
                          )
                        : LoadButton(
                            label: 'Continue',
                            color: primaryColor,
                            function: () {
                              logic.updateProfile(context);
                              // log('${state.imagesSelected.length}');
                            }),
                    10.0.h.spacingH,
                    Center(
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.SIGNINVIEW),
                        child: CustomText(
                          text: 'Skip',
                          textColor: primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
