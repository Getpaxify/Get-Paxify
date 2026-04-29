import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paxify/api/profile_api.dart';
import 'package:paxify/app_service/local_storage.dart';
import 'package:paxify/model/get_doctor_model.dart';
import 'package:paxify/model/upcoming_appointment_model.dart';
import 'package:paxify/modules/home_therapy/home_state.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/modules/setting/setting_state.dart';
import 'package:paxify/widgets/snackbar.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  final ScrollController scrollController = ScrollController();
  final SettingLogic settingLogic = Get.find<SettingLogic>();

  SettingState get settinState => settingLogic.state;
  LocalStorage storage = LocalStorage();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    state.id.value = await storage.getVarable('id') ?? '';

    settingLogic.getUserDetail(Get.context!, state.id.value);
    settingLogic.getSubPlan(Get.context!);
    getDoctor(Get.context!);
    log('irfdshgdhygf gfhgjvcxc xgh');
    getUpcomingAppointment(Get.context!);
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.offset > 150.h && !state.isAppBarCollapsed.value) {
      // AppBar is fully collapsed, change status bar to dark

      state.isAppBarCollapsed.value = true;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else if (scrollController.offset <= 150.h &&
        state.isAppBarCollapsed.value) {
      // AppBar is visible, change status bar to light

      state.isAppBarCollapsed.value = false;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
  }

  final api = Get.put(ProfileApi());
  Future<void> getDoctor(BuildContext context) async {
    state.isLoading.value = true;
    final req = await api.getDoctor();
    state.isLoading.value = false;
    final reqBody = req.body;
    if (reqBody['status'] == 200) {
      state.doctor.value = List<GetDoctorData>.from(
          reqBody['data'].map((x) => GetDoctorData.fromJson(x)));

      log('all is ${state.doctor.length}');
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> getUpcomingAppointment(BuildContext context) async {
    state.isUpcoming.value = true;
    final req = await api.getUpcomingAppointment();
    state.isUpcoming.value = false;
    final reqBody = req.body;
    if (reqBody['status'] == 200) {
      state.upcomingAppointment.value = List<UpcomingAppointmentData>.from(
          reqBody['data'].map((x) => UpcomingAppointmentData.fromJson(x)));

      log('all is ${state.doctor.length}');
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> book(
    BuildContext context,
    String doctorId,
    String scheduledAt,
  ) async {
    state.isBookDoctor.value = true;
    final req = await api.bookDoctor(doctorId, scheduledAt);
    state.isBookDoctor.value = false;
    final reqBody = req.body;
    if (reqBody['status'] == 201) {
      AppSnackbar.success(context, message: reqBody['message']);
      Get.back();
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void bookDoctor(
    BuildContext context,
    String doctorId,
    String scheduledAt, // e.g. "2025-10-30 8:00AM" or similar
  ) {
    final now = DateTime.now();
    final format = DateFormat("yyyy-MM-dd h:mma");

    try {
      // Parse full date + time
      final scheduledDateTime = format.parse(scheduledAt);

      // Compare dates
      final isSameDay = now.year == scheduledDateTime.year &&
          now.month == scheduledDateTime.month &&
          now.day == scheduledDateTime.day;

      if (isSameDay) {
        // Today → compare time
        if (now.isAfter(scheduledDateTime)) {
          AppSnackbar.error(context,
              message:
                  "You can't book a time that has already passed (${DateFormat('h:mma').format(scheduledDateTime)}).");
          return;
        }
      } else if (scheduledDateTime.isBefore(now)) {
        // If the scheduled date itself is before today
        AppSnackbar.error(context,
            message:
                "You can't book a past date (${DateFormat('yMMMd').format(scheduledDateTime)}).");
        return;
      }

      final isoString = scheduledDateTime.toUtc().toIso8601String();
      book(context, doctorId, isoString);
    } catch (e) {
      AppSnackbar.error(context, message: "Invalid date or time format.");
    }
  }
}
