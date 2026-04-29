import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/appointment/appointment.dart';
import 'package:paxify/modules/choose_option/choose_option.dart';
import 'package:paxify/modules/choose_option/choose_option_state.dart';
import 'package:paxify/modules/consultant/home_therapy/home_view.dart';
import 'package:paxify/modules/home_therapy/home_view.dart';
import 'package:paxify/modules/setting/setting.dart';
import 'package:paxify/theme/app_colors.dart';

import 'bottom_nav_logic.dart';

class BottomNavView extends StatelessWidget {
  BottomNavView({super.key});
  final logic = Get.find<BottomNavLogic>();
  final state = Get.find<BottomNavLogic>().state;
  final userNature = Get.put(ChooseOptionState());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
      },
      child: Obx(() => Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.r))),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                clipBehavior: Clip.hardEdge,
                child: BottomNavigationBar(
                  currentIndex: state.currenIndex.value,
                  backgroundColor: const Color(0xffF0F0F0),
                  selectedItemColor: appGreen,
                  unselectedItemColor: blackColor,
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedLabelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  onTap: logic.changeTabIndex,
                  items: [
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      label: 'Appointment',
                      icon: Image.asset(
                        'images/appoint.png',
                        color: state.currenIndex.value == 1
                            ? appGreen
                            : blackColor,
                        height: state.currenIndex.value == 1 ? 23.h : 20.h,
                        width: state.currenIndex.value == 1 ? 23.w : 20.w,
                      ),
                    ),
                    const BottomNavigationBarItem(
                      label: 'Setting',
                      icon: Icon(Icons.settings_outlined),
                    ),
                  ],
                ),
              ),
            ),
            body: IndexedStack(
              index: state.currenIndex.value,
              children: [
                logic.settinState.profileInformation.value?.role == 'patient'
                    ? HomeView()
                    : ConsultantHomeView(),
                Appointment(),
                Setting()
              ],
            ),
          )),
    );
  }
}
