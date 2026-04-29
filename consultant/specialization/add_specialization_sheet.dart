import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';
import 'package:paxify/widgets/snackbar.dart';

import '../../../theme/app_colors.dart';

class AddSpecializationSheet extends StatelessWidget {
  AddSpecializationSheet({
    super.key,
  });

  final state = Get.find<SettingLogic>().state;

  final logic = Get.find<SettingLogic>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * .5,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
              children: [
                SizedBox(
                  width: 40.w,
                  height: 2,
                  child: Divider(
                    color: greyText,
                  ),
                ),
                16.0.h.spacingH,
                HeaderText(
                  text: 'Add Specialization',
                ),
                14.0.h.spacingH,
                AuthTextField(
                  suffixIcon: Icon(Icons.search),
                  fieldLabel: 'Specialization',
                  controller: logic.specializationController,
                  hintTextStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: greyText),
                  hintText: 'Add specialization e.g Cardiology,Dentistry',
                  onChange: (val) {},
                ),
                14.0.h.spacingH,
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
                15.0.h.spacingH,
                Spacer(),
                LoadButton(
                    label: 'Add Specialization',
                    function: () {
                      if (state.specialization
                          .contains(logic.specializationController.text)) {
                        AppSnackbar.error(context,
                            message: 'Specialization already addded');
                        logic.specializationController.clear();
                      } else if (state.specialization.length == 5) {
                        AppSnackbar.error(context,
                            message:
                                'You can not add more than 4 Specializations');
                      } else {
                        state.specialization
                            .add(logic.specializationController.text);
                        logic.specializationController.clear();
                      }
                    })
              ],
            )),
      ),
    );
  }
}
