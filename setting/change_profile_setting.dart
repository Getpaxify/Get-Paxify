import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';
import 'package:paxify/widgets/snackbar.dart';

class ChangeProfileSetting extends StatelessWidget {
  ChangeProfileSetting({super.key});
  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const HeaderText(
          text: "Profile Setting",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          textColor: appBlack,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() => Column(
            children: [
              // Settings Options

              ListTile(
                onTap: () {
                  Get.toNamed(Routes.CHANGEPASSWORD);
                },
                leading: const Icon(
                  Icons.lock_outline,
                  color: primaryColor,
                ),
                title: CustomText(
                  text: "Change Password",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: appBlack,
                ),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
              // 14.0.h.spacingH,
              ListTile(
                leading: Image.asset(
                  'images/bio.png',
                  height: 20.h,
                  width: 16.w,
                ),
                title: CustomText(
                  text: "Biometrics",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: appBlack,
                ),
                trailing: Transform.scale(
                    scale: 0.7,
                    child: Switch(
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        trackOutlineColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        trackColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return primaryColor;
                          }
                          return const Color(
                              0xffC2C2C2); // Track color when switch is OFF
                        }),
                        thumbColor: MaterialStateProperty.all(
                            Colors.white), // Thumb color
                        overlayColor: MaterialStateProperty.all(primaryColor),
                        value: state.enableBiometric.value,
                        onChanged: (p0) {
                          Get.bottomSheet(Container(
                            height: MediaQuery.of(context).size.height * .28,
                            width: double.infinity,
                            padding: EdgeInsets.all(24.sp),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40.r))),
                            child: Column(
                              children: [
                                CustomText(
                                  text:
                                      'Enter your password to enable biometrics',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                16.0.spacingH,
                                AuthTextField(
                                  fieldLabel: 'Password',
                                  controller: logic.passwordController,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        if (!state.isVisibility.value) {
                                          state.isVisibility.value = true;
                                        } else {
                                          state.isVisibility.value = false;
                                        }
                                      },
                                      icon: const Icon(
                                          Icons.visibility_outlined)),
                                ),
                                const Spacer(),
                                LoadButton(
                                    label: 'Continue',
                                    function: state.storedPassword.value.isEmpty
                                        ? () {
                                            AppSnackbar.error(context,
                                                message:
                                                    'Kindly login afresh to enable this feature');
                                          }
                                        : () {
                                            if (logic.passwordController.text
                                                    .trim() ==
                                                state.storedPassword.value) {
                                                   if (!state.enableBiometric.value) {
                                              state.enableBiometric.value =
                                                  true;
                                              logic.storage.saveBoolVariable(
                                                  'biometric',
                                                  state.enableBiometric.value);
                                            } else {
                                              state.enableBiometric.value =
                                                  false;
                                              logic.storage.saveBoolVariable(
                                                  'biometric',
                                                  state.enableBiometric.value);
                                            }
                                            Get.back();
                                                } else {
                                                AppSnackbar.error(context,
                                                message:
                                                    'Incorrect Password entered');  
                                                }
                                          })
                              ],
                            ),
                          ));
                          // state.enableBiometric.value = p0;
                        })),
              ),
            ],
          )),
    );
  }
}
