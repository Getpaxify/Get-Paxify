import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/choose_option/choose_option_state.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/widgets/custom_text.dart';

class Setting extends StatelessWidget {
  Setting({super.key});
  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;
  final userNature = Get.put(ChooseOptionState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 0,
      ),
      body: Obx(() => Column(
            children: [
              // Profile Section
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    state.profileInformation.value?.profileImage == null
                        ? const Icon(
                            Icons.image,
                            color: whiteColor,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              state.profileInformation.value?.profileImage ??
                                  '',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: SizedBox(
                                    height: 40.h,
                                    width: 40.h,
                                    child: const CircularProgressIndicator(),
                                  ),
                                );
                              },
                              errorBuilder: (context, url, error) =>
                                  const Icon(Icons.broken_image),
                            ),
                          ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.isLoading.value
                            ? const CircularProgressIndicator()
                            : HeaderText(
                                text:
                                    state.profileInformation.value?.fullName ??
                                        '',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                textColor: appBlack,
                              ),
                        CustomText(
                            text: state.profileInformation.value?.role ?? '',
                            fontSize: 14,
                            textColor: appBlack),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              // Settings Options
              SettingsTile(
                onTap: () {
                  Get.toNamed(Routes.PROFILESETTING);
                },
                icon: 'images/profile.png',
                title: "Profile Settings",
                subtitle:
                    "Change Your Profile Picture, Name, And Other Important Information",
              ),
              if(state.profileInformation.value?.role=='doctor')
              ...[
                SettingsTile(
                      onTap: () {
                      Get.toNamed(Routes.UPLOAD, arguments: 'in_app');
                      },
                      icon: 'images/sub.png',
                      title: "Upload Licenses/IDs",
                      subtitle: "Upload Your Professional Licenses And Identification Documents.",
                    ),
              ],
              userNature.userNature.value != 1
                  ? const SizedBox.shrink()
                  : SettingsTile(
                      onTap: () {
                      Get.toNamed(Routes.AVAILABLEPLAN);
                      },
                      icon: 'images/sub.png',
                      title: "Subscription Settings",
                      subtitle: "View The Details Of Your Subscription Plan.",
                    ),

              SettingsTile(
                onTap: () {
                  Get.toNamed(Routes.CHANGEPROFILESETTING);
                },
                icon: 'images/privacy.png',
                title: "Privacy And Safety",
                subtitle: "Change Your Account’s Password And Biometrics.",
              ),
              SettingsTile(
                onTap: () {
                  Get.toNamed(Routes.HELPCENTER);
                },
                icon: 'images/help.png',
                title: "Help Centre",
                subtitle: "Explore Our Help Centre For Support And Assistance.",
              ),
              const Divider(),
              // const Spacer(),
              // Logout Button
              ListTile(
                leading: Image.asset(
                  'images/logout.png',
                  height: 18,
                ),
                title: const CustomText(
                  text: "Logout",
                  fontSize: 16,
                ),
                onTap: () {
                  logic.logOut();
                },
              ),
            ],
          )),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Function() onTap;
  final EdgeInsets? padding;

  const SettingsTile(
      {super.key,
      required this.onTap,
      this.padding,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: transparent,
      focusColor: transparent,
      leading: Image.asset(icon, height: 18),
      trailing: const Icon(
        Icons.chevron_right,
        color: appBlack,
      ),
      title: CustomText(
        text: title,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        textColor: appBlack,
      ),
      subtitle: Padding(
        padding: padding ?? const EdgeInsets.only(top: 8.0),
        child: CustomText(text: subtitle, fontSize: 12.sp, textColor: appBlack),
      ),
      onTap: onTap,
    );
  }
}
