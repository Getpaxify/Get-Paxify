import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/choose_option/choose_option_state.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/widgets/custom_text.dart';

class ProfileSetting extends StatelessWidget {
   ProfileSetting({super.key});
   final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;
  final userNature = Get.put(ChooseOptionState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  InkWell(
          onTap: () {
            Get.back();
          },child: const Icon(Icons.chevron_left, color: Colors.black)),
        title:  const HeaderText(
          text: "Profile Settings",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          textColor: appBlack,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Get.toNamed(Routes.EDITPROFILE);
            },
            leading: Image.asset('images/profile.png', height: 18.h),
            title: CustomText(
              text: "Edit Profile",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: appBlack,
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            leading: Image.asset('images/profile.png', height: 18.h),
            title: CustomText(
              text: "Delete your account",
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
