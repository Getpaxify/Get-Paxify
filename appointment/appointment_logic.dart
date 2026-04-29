import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:paxify/modules/appointment/appointment_state.dart';

class AppointmentLogic extends GetxController {
  AppointmentState state = AppointmentState();
  String formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod; // 12-hour format
    final minute = time.minute.toString().padLeft(2, '0'); // Add leading zero
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';

    return '$hour:$minute $period';
  }

  TextEditingController controller = TextEditingController();
}
